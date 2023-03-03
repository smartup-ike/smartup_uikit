import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_sizes.dart';
import 'package:smartup_uikit/src/uikit_icon_theme.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'theme/uikit_toggle_switch_theme_data.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';

class UIKitToggleSwitch extends HookWidget {
  const UIKitToggleSwitch({
    super.key,
    required this.isActive,
    this.icon,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.size,
  }) : assert(
          size == null,
          'Must be null by default. Use named constructors if you want to change the value',
        );

  const UIKitToggleSwitch.small({
    super.key,
    required this.isActive,
    this.icon,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : size = UIKitSizes.small;

  const UIKitToggleSwitch.large({
    super.key,
    required this.isActive,
    this.icon,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : size = UIKitSizes.large;

  /// [bool] that dictates whether the switch is on or off.
  final bool isActive;

  /// Icon that is displayed inside the circle of this switch.
  final Widget? icon;

  /// [VoidCallback] that is called when the switch is pressed.
  final VoidCallback? onTap;

  /// [UIKitColorScheme] determining the value of different color
  /// attributes of this switch.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] determining the value of different size
  /// attributes of this switch.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] determining the value of different shadow
  /// attributes of this switch.
  final UIKitShadowScheme? shadowScheme;

  /// [UIKitSizes] determining the size of this widget. Must be null by default.
  /// Use named constructors if you want to ghange the value.
  final UIKitSizes? size;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final themeData$ = useState(UIKitTheme.of(context).toggleSwitchThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));
    final size$ = useState(findSize(themeData$.value));

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return Center(
      child: MouseRegion(
        cursor: state$.value == UIKitState.disabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onHover: (_) {
          if (onTap != null) {
            state$.value = UIKitState.hover;
            isHovered$.value = true;
          }
        },
        onExit: (_) {
          if (onTap != null) {
            state$.value = UIKitState.defaultState;
            isHovered$.value = false;
          }
        },
        child: GestureDetector(
          onTap: onTap,
          onTapDown: (_) {
            if (onTap != null) {
              state$.value = UIKitState.focused;
            }
          },
          onTapUp: (_) {
            if (onTap != null) {
              state$.value =
                  isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
            }
          },
          onTapCancel: () {
            if (onTap != null) {
              state$.value =
                  isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
            }
          },
          child: SizedBox(
            height: size$.value.height,
            width: size$.value.width,
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      size$.value.borderRadius ?? 8,
                    ),
                    child: ColoredBox(
                      color: colorHelper.backgroundColor ?? Colors.grey,
                      child: SizedBox(
                        width: size$.value.width,
                        height: size$.value.spacing,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isActive ? null : 0,
                  right: isActive ? 0 : null,
                  child: Container(
                    width: size$.value.height,
                    height: size$.value.height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorHelper.contentColor,
                      border: Border.all(
                        color: colorHelper.borderColor ?? Colors.transparent,
                        width: size$.value.borderSize ?? 1,
                      ),
                      boxShadow: colorHelper.shadows,
                    ),
                    child: icon != null
                        ? Center(
                            child: UIKitIconTheme(
                              color: colorHelper.secondaryContentColor,
                              size: size$.value.iconSize,
                              child: icon!,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  UIKitSizeScheme findSize(UIKitToggleSwitchThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    if (this.sizeScheme != null) {
      sizeScheme = this.sizeScheme!;
    } else {
      switch (size) {
        case UIKitSizes.small:
          sizeScheme = themeData.smallSize;
          break;
        case UIKitSizes.large:
          sizeScheme = themeData.largeSize;
          break;
        default:
          sizeScheme = themeData.largeSize;
          break;
      }
    }
    return sizeScheme;
  }
}
