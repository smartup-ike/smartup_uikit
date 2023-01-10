import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_size_scheme.dart';
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
  });

  final bool? isActive;
  final bool? hasIcon;
  final VoidCallback? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
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
        child: Center(
          child: SizedBox(
            height: 24,
            width: 40,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const ColoredBox(
                        color: Color(0xFFE8E8F3),
                        child: SizedBox(width: 48, height: 20),
                      ),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isActive ?? false ? null : 0,
                  right: isActive ?? false ? 0 : null,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(
                        color: borderColor ?? Colors.transparent,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF690A10).withOpacity(0.24),
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                        BoxShadow(
                          color: const Color(0xFF58060C).withOpacity(0.16),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
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
}
