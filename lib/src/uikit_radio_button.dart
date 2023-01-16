import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/theme/su_theme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'theme/su_radio_button_theme_data.dart';

class UIKitRadioButton extends HookWidget {
  const UIKitRadioButton({
    super.key,
    required this.isSelected,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  /// [VoidCallback] that will be called when this button is tapped.
  /// Set to null to make this button disabled;
  final VoidCallback? onTap;

  /// [bool] indicating if this radio button is currently selected.
  final bool isSelected;

  /// [UIKitColorScheme] determining the value of different color
  /// attributes of this radio button.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] determining the value of different size attributes
  /// of this radio button.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] determining the value of different shadow attributes
  /// of this radio button.
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final themeData = SUTheme.of(context).radioButtonThemeData;

    useEffect(() {
      if (onTap == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onTap == null]);

    UIKitColorScheme radioColors = _defineColors(context, themeData);
    UIKitSizeScheme radioSize = _defineSize(context, themeData);
    UIKitShadowScheme radioShadows = _defineShadow(context, themeData);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = radioColors.defaultBackgroundColor;
        contentColor = radioColors.defaultContentColor;
        borderColor = radioColors.defaultBorderColor;
        shadows = radioShadows.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = radioColors.hoverBackgroundColor;
        contentColor = radioColors.hoverContentColor;
        borderColor = radioColors.hoverBorderColor;
        shadows = radioShadows.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = radioColors.focusedBackgroundColor;
        contentColor = radioColors.focusedContentColor;
        borderColor = radioColors.focusedBorderColor;
        shadows = radioShadows.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = radioColors.activeBackgroundColor;
        contentColor = radioColors.activeContentColor;
        borderColor = radioColors.activeBorderColor;
        shadows = radioShadows.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = radioColors.disabledBackgroundColor;
        contentColor = radioColors.disabledContentColor;
        borderColor = radioColors.disabledBorderColor;
        shadows = radioShadows.disabledShadow;
        break;
      default:
        break;
    }

    return MouseRegion(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: radioSize.width,
          height: radioSize.height,
          decoration: BoxDecoration(
              border: Border.all(
                width: radioSize.borderSize ?? 1,
                color: borderColor ?? Colors.transparent,
              ),
              color: backgroundColor ?? Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: shadows),
          child: Padding(
            padding: radioSize.padding ?? const EdgeInsets.all(2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: radioSize.spacing,
              height: radioSize.spacing,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? contentColor : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  UIKitColorScheme _defineColors(
    BuildContext context,
    SURadioButtonThemeData themeData,
  ) {
    UIKitColorScheme radioColors;

    if (colorScheme == null) {
      radioColors = themeData.colorScheme;
    } else {
      radioColors = colorScheme!;
    }

    return radioColors;
  }

  UIKitSizeScheme _defineSize(
    BuildContext context,
    SURadioButtonThemeData themeData,
  ) {
    UIKitSizeScheme radioSize;

    if (sizeScheme == null) {
      radioSize = themeData.sizeScheme;
    } else {
      radioSize = sizeScheme!;
    }
    return radioSize;
  }

  UIKitShadowScheme _defineShadow(
    BuildContext context,
    SURadioButtonThemeData themeData,
  ) {
    UIKitShadowScheme radioShadow;

    if (shadowScheme == null) {
      radioShadow = themeData.shadowScheme;
    } else {
      radioShadow = shadowScheme!;
    }
    return radioShadow;
  }
}
