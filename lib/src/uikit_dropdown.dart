import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'uikit_button.dart';
import 'uikit_checkbox.dart';

class _DropdownRouteChildDelegate extends SingleChildLayoutDelegate {
  final RelativeRect position;

  _DropdownRouteChildDelegate(this.position);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    final double buttonHeight = size.height - position.top - position.bottom;
    print('Top: ${position.top}, Bot: ${position.bottom}');
    print('Height: ${childSize.height}');
    // Find the ideal vertical position.
    double y;
    if (position.top > position.bottom) {
      // Menu button is closer to the bottom edge
      if (childSize.height > position.bottom) {
        // Child can not fit to the bottom, so grow to the top, aligned to the top edge.
        y = position.top - childSize.height;
      } else {
        // Child can fit to the bottom, so grow to the bottom, aligned to the bottom edge.
        y = position.top + buttonHeight;
      }
    } else {
      // Menu button is closer to the top edge, so grow to the bottom, aligned to the bottom edge.
      y = position.top + buttonHeight;
    }
    // Find the ideal horizontal position.
    double x;
    if (position.left >= position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
    } else {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    }
    final Offset wantedPosition = Offset(x, y);
    final Offset originCenter = position.toRect(Offset.zero & size).center;
    final Iterable<Rect> subScreens =
        DisplayFeatureSubScreen.subScreensInBounds(Offset.zero & size, []);
    final Rect subScreen = _closestScreen(subScreens, originCenter);
    return _fitInsideScreen(subScreen, childSize, wantedPosition);
  }

  Rect _closestScreen(Iterable<Rect> screens, Offset point) {
    Rect closest = screens.first;
    for (final Rect screen in screens) {
      if ((screen.center - point).distance <
          (closest.center - point).distance) {
        closest = screen;
      }
    }
    return closest;
  }

  Offset _fitInsideScreen(Rect screen, Size childSize, Offset wantedPosition) {
    double x = wantedPosition.dx;
    double y = wantedPosition.dy;
    // Avoid going outside an area defined as the rectangle 8.0 pixels from the
    // edge of the screen in every direction.
    if (x < screen.left) {
      x = screen.left;
    } else if (x + childSize.width > screen.right) {
      x = screen.right - childSize.width;
    }
    if (y < screen.top) {
      y = screen.top - 8;
    } else if (y + childSize.height > screen.bottom) {
      y = screen.bottom - childSize.height;
    }

    return Offset(x, y);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest).deflate(
      const EdgeInsets.all(16),
    );
  }

  @override
  bool shouldRelayout(covariant _DropdownRouteChildDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _DropdownRoute<T> extends PopupRoute<T> {
  final Widget child;
  final RelativeRect position;

  _DropdownRoute({
    required this.child,
    required this.position,
  });
  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Click to dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    Alignment alignment;
    Size? size = Size.zero;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      size = context.size;
    });
    if (position.left < position.right) {
      if (size!.height > position.bottom) {
        alignment = Alignment.topLeft;
      } else {
        alignment = Alignment.bottomLeft;
      }
    } else {
      if (size!.height > position.bottom) {
        alignment = Alignment.bottomRight;
      } else {
        alignment = Alignment.topRight;
      }
    }
    return CustomSingleChildLayout(
      delegate: _DropdownRouteChildDelegate(position),
      child: ScaleTransition(
        alignment: alignment,
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}

class UIKitDropdownButton extends StatelessWidget {
  const UIKitDropdownButton({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UIKitButton.primary(
      labelText: const Text("Open me"),
      onTap: () {
        final box = context.findRenderObject()! as RenderBox;
        final RenderBox overlay = Navigator.of(context)
            .overlay!
            .context
            .findRenderObject()! as RenderBox;
        const offset = Offset.zero;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            box.localToGlobal(offset, ancestor: overlay),
            box.localToGlobal(
              box.size.bottomRight(Offset.zero) + offset,
              ancestor: overlay,
            ),
          ),
          Offset.zero & overlay.size,
        );
        Navigator.of(context).push(
          _DropdownRoute(child: child, position: position),
        );
      },
    );
  }
}

/// ```dart
///   Dropdown(
///     child: Text(),
///     builder: (context) => UIKitDropdown(...),
///   )
/// ```

/// ```dart
/// UIKitDropdown(
///   value: '',
///   onChange: (List<String> newValue) {
///
///   }
///   children: [
///     DropdownOption<String>(
///       value: 'option_1',
///       label: Text('kati'),
///       trailing: FlutterLogo(),
///       selectable: false,
///       disabled: false,
///       children: [
///         DropdownOption(
///           value: 'value_1_1',
///         ),
///       ],
///     ),
///     DropdownOption(
///       label: Text('kati allo'),
///     ),
///   ],
/// ),
/// ```

class UIKitDropdownMenu<T> extends HookWidget {
  const UIKitDropdownMenu({
    super.key,
    this.value,
    required this.onChange,
    this.children = const [],
    required this.multiselect,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  final T? value;
  final ValueChanged<T> onChange;
  final List<UIKitDropdownMenuItem<T>> children;
  final bool multiselect;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return children[index];
        },
        itemCount: children.length,
      ),
    );
  }
}

class UIKitDropdownMenuItem<T> extends HookWidget {
  const UIKitDropdownMenuItem({
    super.key,
    required this.value,
    this.label,
    this.trailing,
    this.children,
    required this.selectable,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  final T value;
  final Widget? label;
  final Widget? trailing;
  final List<UIKitDropdownMenuItem<T>>? children;
  final bool selectable;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (selectable) ...[
          UIKitCheckbox(
            icon: Icon(Icons.abc),
            colorScheme: colorScheme,
            sizeScheme: sizeScheme,
          ),
          const SizedBox(width: 8),
        ],
        DefaultTextStyle(
          style: sizeScheme?.labelTextStyle ?? TextStyle(),
          child: label ?? const SizedBox(),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}
