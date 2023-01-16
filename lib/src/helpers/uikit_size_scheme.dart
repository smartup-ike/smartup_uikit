import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartup_uikit/src/uikit_icon_theme.dart';

class UIKitSizeScheme {
  factory UIKitSizeScheme({
    double? height,
    double? width,
    double? iconSize,
    double? borderSize,
    double? borderRadius,
    double? pressedBorderSize,
    EdgeInsets? padding,
    TextStyle? labelTextStyle,
  }) {
    return UIKitSizeScheme._(
      height: height,
      width: width,
      iconSize: iconSize,
      borderSize: borderSize,
      borderRadius: borderRadius,
      pressedBorderSize: pressedBorderSize,
      padding: padding,
      labelTextStyle: labelTextStyle,
    );
  }

  UIKitSizeScheme._({
    this.height,
    this.width,
    this.iconSize,
    this.borderSize,
    this.borderRadius,
    this.pressedBorderSize,
    this.padding,
    this.labelTextStyle,
  });

  UIKitSizeScheme.defaultScheme() {
    height = 40;
    iconSize = UIKitIconSize.size16;
    borderSize = 1;
    borderRadius = 4;
    pressedBorderSize = 2;
    labelTextStyle = GoogleFonts.getFont(
      'Open Sans',
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
  }

  /// Creates a copy of this UIKitSizeScheme but with the given fields replaced with
  /// the new values.
  UIKitSizeScheme copyWith({
    double? height,
    double? width,
    double? iconSize,
    double? borderSize,
    double? borderRadius,
    double? pressedBorderSize,
    EdgeInsets? padding,
    TextStyle? labelTextStyle,
  }) {
    return UIKitSizeScheme._(
      height: height ?? this.height,
      width: width ?? this.width,
      iconSize: iconSize ?? this.iconSize,
      borderSize: borderSize ?? this.borderSize,
      borderRadius: borderRadius ?? this.borderRadius,
      pressedBorderSize: pressedBorderSize ?? this.pressedBorderSize,
      padding: padding ?? this.padding,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  double? height;
  double? width;
  double? iconSize;
  double? borderSize;
  double? borderRadius;
  double? pressedBorderSize;
  EdgeInsets? padding;
  TextStyle? labelTextStyle;
}
