import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';
import 'package:smartup_uikit/src/theme/su_button_theme_data.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/size_scheme.dart';
import 'uikit_icon_theme.dart';

/// [UIKitButton] is a button that can have a leading [Widget], a trailing [Widget]
/// and a label [Widget].
class UIKitButton extends HookWidget {
  const UIKitButton({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding,
  });

  /// Function that is called on button tap.
  ///
  /// Set onTap = null if the button is disabled
  final VoidCallback? onTap;

  /// [Widget] for the label text.
  ///
  /// If the widget contains [Text], the style changes automatically.
  final Widget? labelText;

  /// [Widget] for the leading icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget? leading;

  /// [Widget] for the trailing icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget? trailing;

  /// [SizeScheme] an object containing info for the button's height, icon size and text style
  final SizeScheme? sizeScheme;

  /// [UIKitColorScheme] an object containing different colors for all the button's states
  final UIKitColorScheme? colorScheme;

  /// Boolean indicating wether the button has shadow
  final bool? hasShadow;

  /// Boolean of the button to remove initial padding.
  final bool? removePadding;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final buttonTheme = SUTheme.of(context).buttonThemeData;

    UIKitColorScheme buttonColors = colorScheme ?? buttonTheme.colorScheme;

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

    if (onTap != null) {
      switch (state$.value) {
        case UIKitState.defaultState:
          backgroundColor = buttonColors.defaultBackgroundColor;
          contentColor = buttonColors.defaultContentColor;
          borderColor = buttonColors.defaultBorderColor;
          break;
        case UIKitState.hover:
          backgroundColor = buttonColors.hoverBackgroundColor;
          contentColor = buttonColors.hoverContentColor;
          borderColor = buttonColors.hoverBorderColor;
          break;
        case UIKitState.focused:
          backgroundColor = buttonColors.focusedBackgroundColor;
          contentColor = buttonColors.focusedContentColor;
          borderColor = buttonColors.focusedBorderColor;
          break;
        case UIKitState.active:
          backgroundColor = buttonColors.activeBackgroundColor;
          contentColor = buttonColors.activeContentColor;
          borderColor = buttonColors.activeBorderColor;
          break;
        case UIKitState.disabled:
          backgroundColor = buttonColors.disabledBackgroundColor;
          contentColor = buttonColors.disabledContentColor;
          borderColor = buttonColors.disabledBorderColor;
          break;
        default:
          break;
      }
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              strokeAlign: StrokeAlign.outside,
              width: 2,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                strokeAlign: StrokeAlign.outside,
                width: 1,
                color: borderColor ?? Colors.transparent,
              ),
              boxShadow: onTap == null || !(hasShadow ?? true)
                  ? []
                  : state$.value == UIKitState.focused
                      ? [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: const Color(0xFF0D1556).withOpacity(.75),
                          ),
                        ]
                      : [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            color: const Color(0xFF0D1556).withOpacity(.33),
                          ),
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: const Color(0xFF201E8D).withOpacity(.25),
                          ),
                        ],
            ),
            height: sizeScheme?.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!removePadding!) const SizedBox(width: 10),
                if (leading != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: sizeScheme?.height,
                    child: leading!,
                  ),
                  const SizedBox(width: 10),
                ],
                DefaultTextStyle(
                  style: sizeScheme?.labelTextStyle ?? const TextStyle(),
                  child: labelText ?? const Text('Button'),
                ),
                if (!removePadding!) const SizedBox(width: 10),
                if (trailing != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: sizeScheme?.height,
                    child: trailing!,
                  ),
                  if (!removePadding!) const SizedBox(width: 10),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
