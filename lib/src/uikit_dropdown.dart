import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_text_input_theme_data.dart';
import 'theme/uikit_theme.dart';
import 'uikit_icon_theme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
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
  final BoxConstraints constraints;

  _DropdownRoute({
    required this.child,
    required this.position,
    required this.constraints,
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
    if (position.left < position.right) {
      if (position.top > position.bottom) {
        alignment = Alignment.bottomLeft;
      } else {
        alignment = Alignment.topLeft;
      }
    } else {
      if (position.top > position.bottom) {
        alignment = Alignment.bottomRight;
      } else {
        alignment = Alignment.topRight;
      }
    }
    return ConstrainedBox(
      constraints: constraints,
      child: CustomSingleChildLayout(
        delegate: _DropdownRouteChildDelegate(position),
        child: ScaleTransition(
          alignment: alignment,
          scale: animation,
          child: child,
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}

class UIKitDropdownButton extends HookWidget {
  const UIKitDropdownButton({
    Key? key,
    required this.child,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.label,
    this.input,
  }) : super(key: key);

  final Widget child;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: state$.value == UIKitState.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          onHover: (_) {
            if (!isDisabled) {
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
                ? () {}
                : () {
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
                      _DropdownRoute(
                        child: child,
                        position: position,
                        constraints: constraints,
                      ),
                    );
                  },
            onTapDown: (_) {
              if (!isDisabled) {
                state$.value = UIKitState.focused;
              }
            },
            onTapUp: (_) {
              if (!isDisabled) {
                state$.value = isHovered$.value
                    ? UIKitState.hover
                    : UIKitState.defaultState;
              }
            },
            onTapCancel: () {
              if (!isDisabled) {
                state$.value = isHovered$.value
                    ? UIKitState.hover
                    : UIKitState.defaultState;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: size.height,
              width: size.width,
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: size.labelTextStyle
                                  ?.copyWith(color: contentColor) ??
                              const TextStyle().copyWith(color: contentColor),
                          child: label ?? const SizedBox(),
                        ),
                        DefaultTextStyle(
                          style: size.labelTextStyle
                                  ?.copyWith(color: contentColor) ??
                              const TextStyle().copyWith(color: contentColor),
                          child: input ?? const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  UIKitIconTheme(
                    color: contentColor,
                    size: size.iconSize,
                    child: trailing,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  UIKitColorScheme _defineColors(UIKitTextInputThemeData themeData) {
    UIKitColorScheme colorScheme;

    if (this.colorScheme == null) {
      colorScheme = themeData.filledInputcolorScheme;
    } else {
      colorScheme = this.colorScheme!;
    }
    return colorScheme;
  }

  UIKitSizeScheme _defineSize(UIKitTextInputThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    if (this.sizeScheme == null) {
      sizeScheme = themeData.inputSizeScheme;
    } else {
      sizeScheme = this.sizeScheme!;
    }
    return sizeScheme;
  }

  UIKitShadowScheme _defineShadows(UIKitTextInputThemeData themeData) {
    UIKitShadowScheme shadowScheme;

    if (this.shadowScheme == null) {
      shadowScheme = themeData.shadowScheme;
    } else {
      shadowScheme = this.shadowScheme!;
    }
    return shadowScheme;
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
    required this.themeData,
    this.value,
    required this.onChange,
    this.children = const [],
    this.actions = const [],
    required this.multiselect,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.width,
    required this.height,
  });

  final SUThemeData themeData;
  final T? value;
  final ValueChanged<T> onChange;
  final List<UIKitDropdownMenuItem<T>> children;
  final List<Widget> actions;
  final bool multiselect;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return UIKitTheme(
      theme: themeData,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius:
                  BorderRadius.circular(sizeScheme?.borderRadius ?? 8),
            ),
            child: ListView.builder(
              padding: sizeScheme?.padding,
              itemBuilder: (context, index) {
                return children[index];
              },
              itemCount: children.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ),
        ],
      ),
    );
  }
}

class UIKitDropdownMenuItem<T> extends HookWidget {
  const UIKitDropdownMenuItem({
    super.key,
    required this.value,
    required this.onTap,
    this.label,
    this.trailing,
    this.children,
    required this.selectable,
    required this.isSelected,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : assert(
          selectable ^ (trailing != null),
          'Either \'selectable\' is true and the widget has a checkbox or it has a trailing widget, not both.',
        );

  final T value;
  final VoidCallback onTap;
  final Widget? label;
  final Widget? trailing;
  final List<UIKitDropdownMenuItem<T>>? children;
  final bool selectable;
  final bool isSelected;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final isHovered$ = useState(false);
    return MouseRegion(
      onHover: (_) => isHovered$.value = true,
      onExit: (_) => isHovered$.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: colorScheme?.defaultBackgroundColor ?? Colors.transparent,
          child: Row(
            children: [
              if (selectable) ...[
                UIKitCheckbox(
                  isChecked: isSelected,
                  icon: const Icon(
                    Icons.check,
                    size: 12,
                  ),
                  colorScheme: colorScheme,
                  sizeScheme: sizeScheme,
                ),
                const SizedBox(width: 8),
              ],
              DefaultTextStyle(
                style: sizeScheme?.labelTextStyle ?? const TextStyle(),
                child: label ?? const SizedBox(),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
