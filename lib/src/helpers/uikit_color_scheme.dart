import 'package:flutter/material.dart';

class UIKitColorScheme {
  factory UIKitColorScheme({
    Color? defaultBackgroundColor,
    Color? hoverBackgroundColor,
    Color? focusedBackgroundColor,
    Color? activeBackgroundColor,
    Color? disabledBackgroundColor,
    Color? defaultContentColor,
    Color? hoverContentColor,
    Color? focusedContentColor,
    Color? activeContentColor,
    Color? disabledContentColor,
    Color? defaultBorderColor,
    Color? hoverBorderColor,
    Color? focusedBorderColor,
    Color? activeBorderColor,
    Color? disabledBorderColor,
  }) {
    var temp = UIKitColorScheme.defaultScheme().copyWith(
      defaultBackgroundColor: defaultBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      focusedBackgroundColor: focusedBackgroundColor,
      activeBackgroundColor: activeBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      defaultContentColor: defaultContentColor,
      hoverContentColor: hoverContentColor,
      focusedContentColor: focusedContentColor,
      activeContentColor: activeContentColor,
      disabledContentColor: disabledContentColor,
      defaultBorderColor: defaultBorderColor,
      hoverBorderColor: hoverBorderColor,
      focusedBorderColor: focusedBorderColor,
      activeBorderColor: activeBorderColor,
      disabledBorderColor: disabledBorderColor,
    );

    return UIKitColorScheme._(
      defaultBackgroundColor: temp.defaultBackgroundColor,
      hoverBackgroundColor: temp.hoverBackgroundColor,
      focusedBackgroundColor: temp.focusedBackgroundColor,
      activeBackgroundColor: temp.activeBackgroundColor,
      disabledBackgroundColor: temp.disabledBackgroundColor,
      defaultContentColor: temp.defaultContentColor,
      hoverContentColor: temp.hoverContentColor,
      focusedContentColor: temp.focusedContentColor,
      activeContentColor: temp.activeContentColor,
      disabledContentColor: temp.disabledContentColor,
      defaultBorderColor: temp.defaultBorderColor,
      hoverBorderColor: temp.hoverBorderColor,
      focusedBorderColor: temp.focusedBorderColor,
      activeBorderColor: temp.activeBorderColor,
      disabledBorderColor: temp.disabledBorderColor,
    );
  }

  UIKitColorScheme._({
    this.defaultBackgroundColor,
    this.hoverBackgroundColor,
    this.focusedBackgroundColor,
    this.activeBackgroundColor,
    this.disabledBackgroundColor,
    this.defaultContentColor,
    this.hoverContentColor,
    this.focusedContentColor,
    this.activeContentColor,
    this.disabledContentColor,
    this.defaultBorderColor,
    this.hoverBorderColor,
    this.focusedBorderColor,
    this.activeBorderColor,
    this.disabledBorderColor,
  });

  /// Default color scheme. (All black for now)
  UIKitColorScheme.defaultScheme() {
    defaultBackgroundColor = const Color(0xFF000000);
    hoverBackgroundColor = const Color(0xFF000000);
    focusedBackgroundColor = const Color(0xFF000000);
    activeBackgroundColor = const Color(0xFF000000);
    disabledBackgroundColor = const Color(0xFF000000);
    defaultContentColor = const Color(0xFF000000);
    hoverContentColor = const Color(0xFF000000);
    focusedContentColor = const Color(0xFF000000);
    activeContentColor = const Color(0xFF000000);
    disabledContentColor = const Color(0xFF000000);
    defaultBorderColor = const Color(0xFF000000);
    hoverBorderColor = const Color(0xFF000000);
    focusedBorderColor = const Color(0xFF000000);
    activeBorderColor = const Color(0xFF000000);
    disabledBorderColor = const Color(0xFF000000);
  }

  ///
  UIKitColorScheme copyWith({
    Color? defaultBackgroundColor,
    Color? hoverBackgroundColor,
    Color? focusedBackgroundColor,
    Color? activeBackgroundColor,
    Color? disabledBackgroundColor,
    Color? defaultContentColor,
    Color? hoverContentColor,
    Color? focusedContentColor,
    Color? activeContentColor,
    Color? disabledContentColor,
    Color? defaultBorderColor,
    Color? hoverBorderColor,
    Color? focusedBorderColor,
    Color? activeBorderColor,
    Color? disabledBorderColor,
  }) {
    return UIKitColorScheme._(
      defaultBackgroundColor:
          defaultBackgroundColor ?? this.defaultBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      focusedBackgroundColor:
          focusedBackgroundColor ?? this.focusedBackgroundColor,
      activeBackgroundColor:
          activeBackgroundColor ?? this.activeBackgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      defaultContentColor: defaultContentColor ?? this.defaultContentColor,
      hoverContentColor: hoverContentColor ?? this.hoverContentColor,
      focusedContentColor: focusedContentColor ?? this.focusedContentColor,
      activeContentColor: activeContentColor ?? this.activeContentColor,
      disabledContentColor: disabledContentColor ?? this.disabledContentColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
    );
  }

  /// Returns a [UIKitColorScheme] with newScheme values.
  ///
  /// Null values from newScheme set as defaultScheme.
  UIKitColorScheme copyWithScheme({
    UIKitColorScheme? newScheme,
  }) {
    return copyWith(
      defaultBackgroundColor: newScheme?.defaultBackgroundColor,
      hoverBackgroundColor: newScheme?.hoverBackgroundColor,
      focusedBackgroundColor: newScheme?.focusedBackgroundColor,
      activeBackgroundColor: newScheme?.activeBackgroundColor,
      disabledBackgroundColor: newScheme?.disabledBackgroundColor,
      defaultContentColor: newScheme?.defaultContentColor,
      hoverContentColor: newScheme?.hoverContentColor,
      focusedContentColor: newScheme?.focusedContentColor,
      activeContentColor: newScheme?.activeContentColor,
      disabledContentColor: newScheme?.disabledContentColor,
      defaultBorderColor: newScheme?.defaultBorderColor,
      hoverBorderColor: newScheme?.hoverBorderColor,
      focusedBorderColor: newScheme?.focusedBorderColor,
      activeBorderColor: newScheme?.activeBorderColor,
      disabledBorderColor: newScheme?.disabledBorderColor,
    );
  }

  // Background
  Color? defaultBackgroundColor;
  Color? hoverBackgroundColor;
  Color? focusedBackgroundColor;
  Color? activeBackgroundColor;
  Color? disabledBackgroundColor;

  // Content
  Color? defaultContentColor;
  Color? hoverContentColor;
  Color? focusedContentColor;
  Color? activeContentColor;
  Color? disabledContentColor;

  // Border
  Color? defaultBorderColor;
  Color? hoverBorderColor;
  Color? focusedBorderColor;
  Color? activeBorderColor;
  Color? disabledBorderColor;
}
