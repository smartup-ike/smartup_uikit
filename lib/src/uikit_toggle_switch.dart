import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/su_theme.dart';
import 'theme/uikit_toggle_switch_theme_data.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';

class UIKitToggleSwitch extends HookWidget {
  const UIKitToggleSwitch({
    super.key,
    this.isActive,
    this.hasIcon,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  final bool? isActive;
  final bool? hasIcon;
  final VoidCallback? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    UIKitToggleSwitchThemeData themeData =
        SUTheme.of(context).toggleSwitchThemeData;

    UIKitColorScheme toggleSwitchColors = _defineColors(context, themeData);
    UIKitSizeScheme toggleSwitchSize = _defineSize(context, themeData);
    UIKitShadowScheme toggleSwitchShadows = _defineShadow(context, themeData);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = toggleSwitchColors.defaultBackgroundColor;
        contentColor = toggleSwitchColors.defaultContentColor;
        borderColor = toggleSwitchColors.defaultBorderColor;
        shadows = toggleSwitchShadows.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = toggleSwitchColors.hoverBackgroundColor;
        contentColor = toggleSwitchColors.hoverContentColor;
        borderColor = toggleSwitchColors.hoverBorderColor;
        shadows = toggleSwitchShadows.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = toggleSwitchColors.focusedBackgroundColor;
        contentColor = toggleSwitchColors.focusedContentColor;
        borderColor = toggleSwitchColors.focusedBorderColor;
        shadows = toggleSwitchShadows.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = toggleSwitchColors.activeBackgroundColor;
        contentColor = toggleSwitchColors.activeContentColor;
        borderColor = toggleSwitchColors.activeBorderColor;
        shadows = toggleSwitchShadows.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = toggleSwitchColors.disabledBackgroundColor;
        contentColor = toggleSwitchColors.disabledContentColor;
        borderColor = toggleSwitchColors.disabledBorderColor;
        shadows = toggleSwitchShadows.disabledShadow;
        break;
      default:
        break;
    }

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
            height: toggleSwitchSize.height,
            width: toggleSwitchSize.width,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          toggleSwitchSize.borderRadius ?? 8),
                      child: ColoredBox(
                        color: const Color(0xFFE8E8F3),
                        child: SizedBox(
                          width: toggleSwitchSize.width,
                          height: toggleSwitchSize.spacing,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isActive ?? false ? null : 0,
                  right: isActive ?? false ? 0 : null,
                  child: Container(
                    width: toggleSwitchSize.height,
                    height: toggleSwitchSize.height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(
                        color: borderColor ?? Colors.transparent,
                        width: toggleSwitchSize.borderSize ?? 1,
                      ),
                      boxShadow: shadows,
                    ),
                    child: hasIcon ?? false
                        ? Center(
                            child: Icon(
                              isActive ?? false ? Icons.check : Icons.close,
                              size: 16,
                              color: contentColor,
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

  UIKitColorScheme _defineColors(
    BuildContext context,
    UIKitToggleSwitchThemeData themeData,
  ) {
    UIKitColorScheme toggleSwitchColors;

    if (colorScheme == null) {
      toggleSwitchColors = themeData.colorScheme;
    } else {
      toggleSwitchColors = colorScheme!;
    }

    return toggleSwitchColors;
  }

  UIKitSizeScheme _defineSize(
    BuildContext context,
    UIKitToggleSwitchThemeData themeData,
  ) {
    UIKitSizeScheme toggleSwitchSize;

    if (sizeScheme == null) {
      toggleSwitchSize = themeData.sizeScheme;
    } else {
      toggleSwitchSize = sizeScheme!;
    }
    return toggleSwitchSize;
  }

  UIKitShadowScheme _defineShadow(
    BuildContext context,
    UIKitToggleSwitchThemeData themeData,
  ) {
    UIKitShadowScheme toggleSwitchShadow;

    if (shadowScheme == null) {
      toggleSwitchShadow = themeData.shadowScheme;
    } else {
      toggleSwitchShadow = shadowScheme!;
    }
    return toggleSwitchShadow;
  }
}
