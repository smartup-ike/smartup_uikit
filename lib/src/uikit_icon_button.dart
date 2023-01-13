import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitIconButton extends StatelessWidget {
  const UIKitIconButton({
    Key? key,
    this.onTap,
    this.sizeScheme,
    this.colorScheme,
    required this.icon,
    this.hasShadow,
    this.buttonType,
  }) : super(key: key);

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

  /// Boolean indicating wether the button has shadow
  final bool? hasShadow;

  /// Type of the button [UIKitButtonType]
  ///
  /// Use those named constructors to change the buttonType
  /// * primary
  /// * ghost
  final UIKitButtonType? buttonType;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = SUTheme.of(context).buttonThemeData;
    return UIKitButton();
  }
}
