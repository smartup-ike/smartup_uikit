import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_text_input_theme_data.dart';
import 'theme/uikit_theme.dart';
import 'uikit_icon_theme.dart';

class _DropdownRouteChildDelegate extends SingleChildLayoutDelegate {
  final RelativeRect position;
  final Size size;

  _DropdownRouteChildDelegate(this.position, this.size);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    final double buttonHeight = size.height - position.top - position.bottom;
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
    return BoxConstraints(
      maxWidth: size.width,
      maxHeight:
          position.top > position.bottom ? position.top : position.bottom,
    );
  }

  @override
  bool shouldRelayout(covariant _DropdownRouteChildDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class DropdownRoute<T> extends PopupRoute<T> {
  final Widget child;
  final RelativeRect position;
  final Size size;

  DropdownRoute({
    required this.child,
    required this.position,
    required this.size,
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
    return CustomSingleChildLayout(
      delegate: _DropdownRouteChildDelegate(position, size),
      child: ScaleTransition(
        alignment: Alignment.topCenter,
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}

class UIKitDropdownButton<T> extends HookWidget {
  const UIKitDropdownButton({
    Key? key,
    required this.child,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.label,
    this.input,
  }) : super(key: key);

  final Widget child;
  final Future<T?> Function(RelativeRect position, Size size)? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final bool isDisabled;
  final Widget trailing;
  final Widget? label;
  final Widget? input;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isDisabled ? UIKitState.disabled : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);

    final themeData = UIKitTheme.of(context).textInputThemeData;

    useEffect(() {
      state$.value = isDisabled ? UIKitState.disabled : UIKitState.defaultState;
      return;
    }, [isDisabled]);

    UIKitColorScheme colors = _defineColors(themeData);
    UIKitSizeScheme size = _defineSize(themeData);
    UIKitShadowScheme shadows = _defineShadows(themeData);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? currentShadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = colors.defaultBackgroundColor;
        contentColor = colors.defaultContentColor;
        borderColor = colors.defaultBorderColor;
        currentShadows = shadows.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = colors.hoverBackgroundColor;
        contentColor = colors.hoverContentColor;
        borderColor = colors.hoverBorderColor;
        currentShadows = shadows.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = colors.focusedBackgroundColor;
        contentColor = colors.focusedContentColor;
        borderColor = colors.focusedBorderColor;
        currentShadows = shadows.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = colors.activeBackgroundColor;
        contentColor = colors.activeContentColor;
        borderColor = colors.activeBorderColor;
        currentShadows = shadows.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = colors.disabledBackgroundColor;
        contentColor = colors.disabledContentColor;
        borderColor = colors.disabledBorderColor;
        currentShadows = shadows.disabledShadow;
        break;
      default:
        break;
    }
    return MouseRegion(
      cursor: state$.value == UIKitState.disabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onHover: (e) {
        if (!isDisabled && e.kind != PointerDeviceKind.touch) {
          state$.value = UIKitState.hover;
          isHovered$.value = true;
        }
      },
      onExit: (_) {
        if (!isDisabled) {
          state$.value = UIKitState.defaultState;
          isHovered$.value = false;
        }
      },
      child: GestureDetector(
        onTap: isDisabled
            ? null
            : () async {
                const offset = Offset.zero;
                final box = context.findRenderObject()! as RenderBox;
                final RenderBox overlay = Navigator.of(context)
                    .overlay!
                    .context
                    .findRenderObject()! as RenderBox;
                final RelativeRect position = RelativeRect.fromRect(
                  Rect.fromPoints(
                    box.localToGlobal(offset, ancestor: overlay),
                    box.localToGlobal(
                      box.size.bottomRight(offset) + offset,
                      ancestor: overlay,
                    ),
                  ),
                  offset & overlay.size,
                );
                final size = box.size;
                onTap?.call(position, size);
              },
        onTapDown: (_) {
          if (!isDisabled) {
            state$.value = UIKitState.focused;
          }
        },
        onTapUp: (_) {
          if (!isDisabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (!isDisabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: size.height,
          width: size.width,
          padding: size.padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(size.borderRadius ?? 8),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: size.borderSize ?? 1,
            ),
            boxShadow: currentShadows,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: size.labelStyle?.copyWith(color: contentColor) ??
                          const TextStyle().copyWith(color: contentColor),
                      child: label ?? const SizedBox(),
                    ),
                    DefaultTextStyle(
                      style: size.labelStyle?.copyWith(color: contentColor) ??
                          const TextStyle().copyWith(color: contentColor),
                      child: input ?? const SizedBox(),
                    ),
                  ],
                ),
              ),
              UIKitIconTheme(
                color: contentColor,
                size: size.leadingSize,
                child: trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }

  UIKitColorScheme _defineColors(UIKitTextInputThemeData themeData) {
    UIKitColorScheme colorScheme;

    if (this.colorScheme == null) {
      colorScheme = themeData.filledInputColorScheme;
    } else {
      colorScheme = this.colorScheme!;
    }
    return colorScheme;
  }

  UIKitSizeScheme _defineSize(UIKitTextInputThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    if (this.sizeScheme == null) {
      sizeScheme = themeData.smallFilledInputSizeScheme;
    } else {
      sizeScheme = this.sizeScheme!;
    }
    return sizeScheme;
  }

  UIKitShadowScheme _defineShadows(UIKitTextInputThemeData themeData) {
    UIKitShadowScheme shadowScheme;

    if (this.shadowScheme == null) {
      shadowScheme = themeData.filledInputShadowScheme;
    } else {
      shadowScheme = this.shadowScheme!;
    }
    return shadowScheme;
  }
}
