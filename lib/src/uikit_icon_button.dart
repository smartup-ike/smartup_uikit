import 'package:flutter/material.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'uikit_button.dart';

class UIKitIconButton extends StatelessWidget {
  const UIKitIconButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.buttonType,
    this.buttonSize,
    this.isCircle = false,
  }) : super(key: key);

  const UIKitIconButton.smallSolid({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.small;

  const UIKitIconButton.smallGhost({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.small;

  const UIKitIconButton.mediumSolid({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.medium;

  const UIKitIconButton.mediumGhost({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.medium;

  const UIKitIconButton.largeSolid({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.primary,
        buttonSize = UIKitSizes.large;

  const UIKitIconButton.largeGhost({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.isCircle = false,
  })  : buttonType = UIKitButtonType.ghost,
        buttonSize = UIKitSizes.large;

  /// Function that is called on button tap.
  ///
  /// Set onTap = null if the button is disabled
  final VoidCallback? onTap;

  /// [UIKitSizeScheme] an object containing info for the button's height, border size, border radius size, icon size and text style
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme] an object containing different colors for all the button's states
  final UIKitColorScheme? colorScheme;

  /// [UIKitShadowScheme] an object containing different shadows for all the button's states
  final UIKitShadowScheme? shadowScheme;

  /// [Widget] for the icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget icon;

  /// Type of the button [UIKitButtonType]
  ///
  /// Use those named constructors to change the buttonType
  /// * primary
  /// * ghost
  final UIKitButtonType? buttonType;

  /// [UIKitSizes]
  /// Must be null by default.
  /// Use named constructors to change the value.
  final UIKitSizes? buttonSize;

  /// Makes the icon button circular.
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    // Handles button colors according to buttonType.
    final buttonTheme = UIKitTheme.of(context).buttonThemeData;
    UIKitColorScheme colors;
    UIKitShadowScheme shadows;
    UIKitSizeScheme size;
    if (colorScheme != null) {
      colors = colorScheme!;
    } else {
      switch (buttonType) {
        case UIKitButtonType.ghost:
          colors = buttonTheme.ghostIconColors;

          break;
        default:
          colors = buttonTheme.solidIconColors;

          break;
      }
    }
    if (shadowScheme != null) {
      shadows = shadowScheme!;
    } else {
      switch (buttonType) {
        case UIKitButtonType.ghost:
          shadows = buttonTheme.ghostIconShadows;
          break;
        default:
          shadows = buttonTheme.solidIconShadows;
          break;
      }
    }
    if (sizeScheme != null) {
      size = sizeScheme!;
    } else {
      switch (buttonSize) {
        case UIKitSizes.small:
          size = buttonTheme.smallIconSize;
          break;
        case UIKitSizes.large:
          size = buttonTheme.largeIconSize;
          break;
        default:
          size = buttonTheme.mediumIconSize;
          break;
      }
    }

    return SizedBox(
      height: size.height,
      width: size.height,
      child: UIKitButton(
        onTap: onTap,
        trailing: icon,
        labelText: const Text(''),
        sizeScheme: isCircle
            ? size.copyWith(borderRadius: (size.height ?? 0) * 2)
            : size,
        colorScheme: colors,
        shadowScheme: shadows,
      ),
    );
  }
}
