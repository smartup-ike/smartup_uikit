import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';

class UIKitRadioButton extends HookWidget {
  const UIKitRadioButton({
    super.key,
    required this.isSelected,
    this.onTap,
    this.colorScheme,
  });

  /// [VoidCallback] that will be called when this button is tapped.
  /// Set to null to make this button disabled;
  final VoidCallback? onTap;

  /// [bool] indicating if this radio button is currently selected.
  final bool isSelected;

  /// [UIKitColorScheme] determining the value of different color
  /// attributes of this radio button.
  final UIKitColorScheme? colorScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);

    useEffect(() {
      if (onTap == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onTap == null]);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = colorScheme?.defaultBackgroundColor;
        contentColor = colorScheme?.defaultContentColor;
        borderColor = colorScheme?.defaultBorderColor;
        break;
      case UIKitState.hover:
        backgroundColor = colorScheme?.hoverBackgroundColor;
        contentColor = colorScheme?.hoverContentColor;
        borderColor = colorScheme?.hoverBorderColor;
        break;
      case UIKitState.focused:
        backgroundColor = colorScheme?.focusedBackgroundColor;
        contentColor = colorScheme?.focusedContentColor;
        borderColor = colorScheme?.focusedBorderColor;
        break;
      case UIKitState.active:
        backgroundColor = colorScheme?.activeBackgroundColor;
        contentColor = colorScheme?.activeContentColor;
        borderColor = colorScheme?.activeBorderColor;
        break;
      case UIKitState.disabled:
        backgroundColor = colorScheme?.disabledBackgroundColor;
        contentColor = colorScheme?.disabledContentColor;
        borderColor = colorScheme?.disabledBorderColor;
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
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.6,
              color: borderColor ?? Colors.transparent,
            ),
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: onTap == null
                ? []
                : state$.value == UIKitState.focused
                    ? [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: const Color(0xFF690A10).withOpacity(.70),
                        ),
                      ]
                    : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? contentColor : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
