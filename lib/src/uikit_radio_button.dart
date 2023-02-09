import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';

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
    final themeData$ = useState(UIKitTheme.of(context).radioButtonThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));

    useEffect(() {
      if (onTap == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onTap == null]);

    Color? backgroundColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = colors$.value.defaultBackgroundColor;
        borderColor = colors$.value.defaultBorderColor;
        shadows = shadows$.value.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = colors$.value.hoverBackgroundColor;
        borderColor = colors$.value.hoverBorderColor;
        shadows = shadows$.value.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = colors$.value.focusedBackgroundColor;
        borderColor = colors$.value.focusedBorderColor;
        shadows = shadows$.value.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = colors$.value.activeBackgroundColor;
        borderColor = colors$.value.activeBorderColor;
        shadows = shadows$.value.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = colors$.value.disabledBackgroundColor;
        borderColor = colors$.value.disabledBorderColor;
        shadows = shadows$.value.disabledShadow;
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
        child: SizedBox(
          width: size$.value.width,
          height: size$.value.height,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: size$.value.spacing,
            height: size$.value.spacing,
            padding: size$.value.padding ?? const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                width: size$.value.borderSize ?? 1,
                color: borderColor ?? Colors.transparent,
              ),
              color: backgroundColor ?? Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: shadows,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: size$.value.secondarySpacing,
              height: size$.value.secondarySpacing,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? borderColor : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
