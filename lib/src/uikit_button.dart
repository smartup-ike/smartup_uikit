import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/su_theme.dart';
import 'uikit_icon_theme.dart';

enum UIKitButtonType {
  primary,
  secondary,
  secondaryWhite,
  tertiary,
  outline,
  ghost,
}

/// [UIKitButton] is a button that can have a leading [Widget], a trailing [Widget]
/// and a label [Widget].
/// * Recommended type for label [Text]
/// * Recommended type for leading and trailing [UIKitIcon]
///
/// buttonType has to be null.
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
    this.removePadding = false,
    this.buttonType,
  }) : assert(buttonType == null,
            'buttonType has to be null on default constructor. Use one of the named constructors instead e.g.: UIKitButton.primary()');

  const UIKitButton.primary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.primary;

  const UIKitButton.secondary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.secondary;

  const UIKitButton.secondaryWhite({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.secondaryWhite;

  const UIKitButton.tertiary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.tertiary;

  const UIKitButton.outline({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.outline;

  const UIKitButton.ghost({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding = false,
  }) : buttonType = UIKitButtonType.ghost;

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

  /// [UIKitSizeScheme] an object containing info for the button's height, border size, icon size and text style
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme] an object containing different colors for all the button's states
  final UIKitColorScheme? colorScheme;

  /// Boolean indicating wether the button has shadow
  final bool? hasShadow;

  /// Boolean of the button to remove initial padding.
  final bool? removePadding;

  /// Type of the button [UIKitButtonType]
  ///
  /// Use those named constructors to change the buttonType
  /// * primary
  /// * secondary
  /// * secondaryWhite
  /// * tertiary
  /// * outline
  /// * ghost
  final UIKitButtonType? buttonType;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);

    // Handles button colors according to buttonType.
    final buttonTheme = SUTheme.of(context).buttonThemeData;
    UIKitColorScheme buttonColors;
    switch (buttonType) {
      case UIKitButtonType.primary:
        buttonColors = buttonTheme.primaryColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
      case UIKitButtonType.secondary:
        buttonColors = buttonTheme.secondaryColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
      case UIKitButtonType.secondaryWhite:
        buttonColors = buttonTheme.secondaryWhiteColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
      case UIKitButtonType.tertiary:
        buttonColors = buttonTheme.tertiaryColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
      case UIKitButtonType.outline:
        buttonColors = buttonTheme.outlineColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
      case UIKitButtonType.ghost:
        buttonColors =
            buttonTheme.ghostColorScheme.copyWithScheme(newScheme: colorScheme);
        break;
      default:
        buttonColors = buttonTheme.primaryColorScheme
            .copyWithScheme(newScheme: colorScheme);
        break;
    }

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

    // Change the color of the button according to state
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              strokeAlign: StrokeAlign.outside,
              width: sizeScheme?.pressedBorderSize ??
                  buttonTheme.sizeScheme.pressedBorderSize ??
                  0,
              color: (state$.value == UIKitState.focused)
                  ? (borderColor ?? Colors.transparent)
                  : Colors.transparent,
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
                width: sizeScheme?.borderSize ??
                    buttonTheme.sizeScheme.borderSize ??
                    0,
                color: (state$.value == UIKitState.focused)
                    ? Colors.transparent
                    : (borderColor ?? Colors.transparent),
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
            height: sizeScheme?.height ?? buttonTheme.sizeScheme.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!removePadding!) const SizedBox(width: 10),
                if (leading != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: sizeScheme?.height ?? buttonTheme.sizeScheme.iconSize,
                    child: leading!,
                  ),
                  const SizedBox(width: 10),
                ],
                DefaultTextStyle(
                  style: sizeScheme?.labelTextStyle
                          ?.copyWith(color: contentColor) ??
                      buttonTheme.sizeScheme.labelTextStyle!
                          .copyWith(color: contentColor),
                  child: labelText ?? const Text('Button'),
                ),
                if (!removePadding!) const SizedBox(width: 10),
                if (trailing != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: sizeScheme?.height ?? buttonTheme.sizeScheme.iconSize,
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
