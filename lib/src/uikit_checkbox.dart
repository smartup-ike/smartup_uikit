import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';

class UIKitCheckbox extends HookWidget {
  const UIKitCheckbox({
    super.key,
    this.icon,
    this.onChanged,
    this.isChecked,
    this.colorScheme,
    this.sizeScheme,
  });

  final Widget? icon;
  final ValueChanged<bool?>? onChanged;
  final bool? isChecked;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onChanged == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);

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

    return Center(
      child: MouseRegion(
        cursor: state$.value == UIKitState.disabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onHover: (_) {
          if (onChanged != null) {
            state$.value = UIKitState.hover;
            isHovered$.value = true;
          }
        },
        onExit: (_) {
          if (onChanged != null) {
            state$.value = UIKitState.defaultState;
            isHovered$.value = false;
          }
        },
        child: GestureDetector(
          onTap: () {
            onChanged?.call(!(isChecked ?? false));
          },
          onTapDown: (_) {
            if (onChanged != null) {
              state$.value = UIKitState.focused;
            }
          },
          onTapUp: (_) {
            if (onChanged != null) {
              state$.value =
                  isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
            }
          },
          onTapCancel: () {
            if (onChanged != null) {
              state$.value =
                  isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                strokeAlign: StrokeAlign.outside,
                width: 1,
                color: borderColor ?? Colors.transparent,
              ),
            ),
            height: sizeScheme?.height,
            width: sizeScheme?.height,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:
                    isChecked ?? false ? backgroundColor : Colors.transparent,
              ),
              child: isChecked ?? false ? icon : null,
            ),
          ),
        ),
      ),
    );
  }
}
