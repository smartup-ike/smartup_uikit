import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_icon_theme.dart';
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
    final themeData$ = UIKitTheme.of(context).toggleSwitchThemeData;
    final colors = define(colorScheme, themeData$.colorScheme);
    final shadows =
        define(shadowScheme, themeData$.shadowScheme);
    final size = findSize(themeData$);

    final colorHelper = findStateAttributes(
      colors,
      shadows,
      state$.value,
    );

    return Center(
      child: MouseRegion(
        cursor: state$.value == UIKitState.disabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onHover: (e) {
          if (onTap != null && e.kind != PointerDeviceKind.touch) {
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
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      size.borderRadius ?? 8,
                    ),
                    child: ColoredBox(
                      color: colorHelper.backgroundColor ?? Colors.grey,
                      child: SizedBox(
                        width: size.width,
                        height: size.spacing,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isActive ? null : 0,
                  right: isActive ? 0 : null,
                  child: Container(
                    width: size.height,
                    height: size.height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorHelper.contentColor,
                      border: Border.all(
                        color: colorHelper.borderColor ?? Colors.transparent,
                        width: size.borderSize ?? 1,
                      ),
                      boxShadow: colorHelper.shadows,
                    ),
                    child: icon != null
                        ? Center(
                            child: UIKitIconTheme(
                              color: colorHelper.secondaryContentColor,
                              size: size.iconSize,
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
