import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UIKitSizeScheme {
  double? height;
  double? width;
  double? leadingSize;
  double? trailingSize;
  double? iconSize;
  double? spacing;
  double? secondarySpacing;
  double? borderSize;
  double? borderRadius;
  EdgeInsets? padding;
  TextStyle? labelStyle;
  TextStyle? focusedLabelStyle;
  TextStyle? inputStyle;
  TextStyle? assistiveStyle;

  factory UIKitSizeScheme({
    double? height,
    double? width,
    double? leadingSize,
    double? trailingSize,
    double? iconSize,
    double? spacing,
    double? secondarySpacing,
    double? borderSize,
    double? borderRadius,
    EdgeInsets? padding,
    TextStyle? labelStyle,
    TextStyle? focusedLabelStyle,
    TextStyle? inputStyle,
    TextStyle? assistiveStyle,
  }) {
    return UIKitSizeScheme._(
      height: height,
      width: width,
      leadingSize: leadingSize,
      trailingSize: trailingSize,
      iconSize: iconSize,
      spacing: spacing,
      secondarySpacing: secondarySpacing,
      borderSize: borderSize,
      borderRadius: borderRadius,
      padding: padding,
      labelStyle: labelStyle,
      focusedLabelStyle: focusedLabelStyle,
      inputStyle: inputStyle,
      assistiveStyle: assistiveStyle,
    );
  }

  UIKitSizeScheme._({
    this.height,
    this.width,
    this.leadingSize,
    this.trailingSize,
    this.iconSize,
    this.spacing,
    this.secondarySpacing,
    this.borderSize,
    this.borderRadius,
    this.padding,
    this.labelStyle,
    this.focusedLabelStyle,
    this.inputStyle,
    this.assistiveStyle,
  });

  UIKitSizeScheme.defaultScheme() {
    height = 40;
    leadingSize = 16;
    spacing = 8;
    borderSize = 1;
    borderRadius = 4;
    labelStyle = GoogleFonts.getFont(
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
    double? leadingSize,
    double? trailingSize,
    double? iconSize,
    double? spacing,
    double? secondarySpacing,
    double? borderSize,
    double? borderRadius,
    EdgeInsets? padding,
    TextStyle? labelStyle,
    TextStyle? focusedLabelStyle,
    TextStyle? inputStyle,
    TextStyle? assistiveStyle,
  }) {
    return UIKitSizeScheme._(
      height: height ?? this.height,
      width: width ?? this.width,
      leadingSize: leadingSize ?? this.leadingSize,
      trailingSize: trailingSize ?? this.trailingSize,
      iconSize: iconSize ?? this.iconSize,
      spacing: spacing ?? this.spacing,
      secondarySpacing: secondarySpacing ?? this.secondarySpacing,
      borderSize: borderSize ?? this.borderSize,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      labelStyle: labelStyle ?? this.labelStyle,
      focusedLabelStyle: focusedLabelStyle ?? this.focusedLabelStyle,
      inputStyle: inputStyle ?? this.inputStyle,
      assistiveStyle: assistiveStyle ?? this.assistiveStyle,
    );
  }
}
