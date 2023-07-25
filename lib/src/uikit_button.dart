import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_button_theme_data.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

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
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.buttonType,
    this.buttonSize,
  })  : assert(
          buttonType == null,
          'buttonType has to be null on default constructor. Use one of the named constructors instead e.g.: UIKitButton.primary()',
        ),
        assert(
          buttonSize == null,
          'buttonType has to be null on default constructor. Use one of the named constructors instead.',
        );

  const UIKitButton.smallPrimary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.small;

  const UIKitButton.smallSecondary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondary,
        buttonSize = UIKitSizes.small;

  const UIKitButton.smallSecondaryWhite({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondaryWhite,
        buttonSize = UIKitSizes.small;

  const UIKitButton.smallTertiary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.tertiary,
        buttonSize = UIKitSizes.small;

  const UIKitButton.smallOutline({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.outline,
        buttonSize = UIKitSizes.small;

  const UIKitButton.smallGhost({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.small;

  const UIKitButton.mediumPrimary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.mediumSecondary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondary,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.mediumSecondaryWhite({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondaryWhite,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.mediumTertiary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.tertiary,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.mediumOutline({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.outline,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.mediumGhost({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.medium;

  const UIKitButton.largePrimary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.large;

  const UIKitButton.largeSecondary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondary,
        buttonSize = UIKitSizes.large;

  const UIKitButton.largeSecondaryWhite({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.secondaryWhite,
        buttonSize = UIKitSizes.large;

  const UIKitButton.largeTertiary({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.tertiary,
        buttonSize = UIKitSizes.large;

  const UIKitButton.largeOutline({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.outline,
        buttonSize = UIKitSizes.large;

  const UIKitButton.largeGhost({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.large;

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

  /// [UIKitColorScheme] containing information about the colors for all the
  /// different states.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] containing information about the size elements
  /// for all the different states.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] containing information about the shadows for all the
  /// different states.
  final UIKitShadowScheme? shadowScheme;

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

  /// [UIKitSizes] size of this button.
  /// Must be null with default constructor.
  /// Use named constructors to change the value.
  final UIKitSizes? buttonSize;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final theme$ =
        useState<UIKitButtonThemeData>(UIKitTheme.of(context).buttonThemeData);
    final colors$ = useState<UIKitColorScheme>(findColors(theme$.value));
    final size$ = useState<UIKitSizeScheme>(findSize(theme$.value));
    final shadows$ = useState<UIKitShadowScheme>(findShadows(theme$.value));

    // Handles button colors according to buttonType.

    useEffect(() {
      if (onTap == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onTap == null]);

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return MouseRegion(
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
        onTap: () {
          if (state$.value != UIKitState.disabled) {
            onTap?.call();
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
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
          alignment: Alignment.center,
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              width: size$.value.borderSize ?? 0,
              color: colorHelper.borderColor ?? Colors.transparent,
            ),
            boxShadow: colorHelper.shadows,
          ),
          height: size$.value.height,
          width: size$.value.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                UIKitIconTheme(
                  color: colorHelper.contentColor,
                  size: size$.value.leadingSize,
                  child: leading!,
                ),
                SizedBox(width: size$.value.spacing),
              ],
              DefaultTextStyle(
                style: size$.value.labelStyle
                        ?.copyWith(color: colorHelper.contentColor) ??
                    TextStyle(color: colorHelper.contentColor),
                child: labelText ?? const Text('Button'),
              ),
              if (trailing != null) ...[
                SizedBox(width: size$.value.spacing),
                UIKitIconTheme(
                  color: colorHelper.contentColor,
                  size: size$.value.trailingSize,
                  child: trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  UIKitColorScheme findColors(UIKitButtonThemeData themeData) {
    UIKitColorScheme colorScheme;
    if (this.colorScheme != null) {
      colorScheme = this.colorScheme!;
    } else {
      switch (buttonType) {
        case UIKitButtonType.secondary:
          colorScheme = themeData.secondaryColors;
          break;
        case UIKitButtonType.secondaryWhite:
          colorScheme = themeData.secondaryWhiteColors;
          break;
        case UIKitButtonType.tertiary:
          colorScheme = themeData.tertiaryColors;
          break;
        case UIKitButtonType.outline:
          colorScheme = themeData.outlineColors;
          break;
        case UIKitButtonType.ghost:
          colorScheme = themeData.ghostColors;
          break;
        default:
          colorScheme = themeData.primaryColors;
          break;
      }
    }
    return colorScheme;
  }

  UIKitShadowScheme findShadows(UIKitButtonThemeData themeData) {
    UIKitShadowScheme shadowScheme;
    if (this.shadowScheme != null) {
      shadowScheme = this.shadowScheme!;
    } else {
      switch (buttonType) {
        case UIKitButtonType.secondary:
          shadowScheme = themeData.secondaryShadows;
          break;
        case UIKitButtonType.secondaryWhite:
          shadowScheme = themeData.secondaryWhiteShadows;
          break;
        case UIKitButtonType.tertiary:
          shadowScheme = themeData.tertiaryShadows;
          break;
        case UIKitButtonType.outline:
          shadowScheme = themeData.outlineShadows;
          break;
        case UIKitButtonType.ghost:
          shadowScheme = themeData.ghostIconShadows;
          break;
        default:
          shadowScheme = themeData.primaryShadows;
          break;
      }
    }
    return shadowScheme;
  }

  UIKitSizeScheme findSize(UIKitButtonThemeData themeData) {
    UIKitSizeScheme sizeScheme;
    if (this.sizeScheme != null) {
      sizeScheme = this.sizeScheme!;
    } else {
      switch (buttonSize) {
        case UIKitSizes.small:
          sizeScheme = themeData.smallSize;
          break;
        case UIKitSizes.large:
          sizeScheme = themeData.largeSize;
          break;
        default:
          sizeScheme = themeData.mediumSize;
          break;
      }
    }
    return sizeScheme;
  }
}