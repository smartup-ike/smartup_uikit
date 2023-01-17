import 'package:flutter/material.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/su_theme.dart';
import 'uikit_button.dart';

class UIKitIconButton extends StatelessWidget {
  const UIKitIconButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.hasShadow,
    this.buttonType,
    this.isCircle = false,
  }) : super(key: key);

  const UIKitIconButton.primary({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.hasShadow,
    this.isCircle = false,
  }) : buttonType = UIKitButtonType.primary;

  const UIKitIconButton.ghost({
    super.key,
    required this.icon,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    this.hasShadow,
    this.isCircle = false,
  }) : buttonType = UIKitButtonType.ghost;

  /// Function that is called on button tap.
  ///
  /// Set onTap = null if the button is disabled
  final VoidCallback? onTap;

  /// [UIKitSizeScheme] an object containing info for the button's height, border size, border radius size, icon size and text style
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme] an object containing different colors for all the button's states
  final UIKitColorScheme? colorScheme;

  /// [Widget] for the icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget icon;

  /// Boolean indicating whether the button has shadow
  final bool? hasShadow;

  /// Type of the button [UIKitButtonType]
  ///
  /// Use those named constructors to change the buttonType
  /// * primary
  /// * ghost
  final UIKitButtonType? buttonType;

  /// Makes the icon button circular.
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    // Handles button colors according to buttonType.
    final buttonTheme = SUTheme.of(context).buttonThemeData;
    UIKitColorScheme buttonColors;
    switch (buttonType) {
      case UIKitButtonType.primary:
        buttonColors = buttonTheme.primaryColorScheme
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
    UIKitSizeScheme? temp = sizeScheme;
    if (isCircle) {
      temp =
          sizeScheme?.copyWith(borderRadius: ((sizeScheme?.height ?? 0) * 2));
    }
    return SizedBox(
      height: temp?.height,
      width: temp?.height,
      child: UIKitButton(
        onTap: onTap,
        trailing: icon,
        labelText: const Text(''),
        sizeScheme: temp,
        colorScheme: buttonColors,
        hasShadow: hasShadow,
        removePadding: true,
      ),
    );
  }
}
