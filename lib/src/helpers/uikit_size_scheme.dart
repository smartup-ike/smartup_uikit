import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartup_uikit/src/uikit_icon_theme.dart';

class UIKitSizeScheme {
  factory UIKitSizeScheme({
    double? height,
    double? iconSize,
    double? borderSize,
    TextStyle? labelTextStyle,
  }) {
    return UIKitSizeScheme._(
      height: height,
      iconSize: iconSize,
      borderSize: borderSize,
      labelTextStyle: labelTextStyle,
    );
  }

  UIKitSizeScheme._({
    this.height,
    this.iconSize,
    this.borderSize,
    this.labelTextStyle,
  });

  UIKitSizeScheme.defaultScheme() {
    height = 40;
    iconSize = UIKitIconSize.size16;
    borderSize = 1;
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
    double? iconSize,
    double? borderSize,
    TextStyle? labelTextStyle,
  }) {
    return UIKitSizeScheme._(
      height: height ?? this.height,
      iconSize: iconSize ?? this.iconSize,
      borderSize: borderSize ?? this.borderSize,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  double? height;
  double? iconSize;
  double? borderSize;
  TextStyle? labelTextStyle;
}
