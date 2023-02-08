import 'package:flutter/material.dart';

class UIKitColorScheme {
  factory UIKitColorScheme({
    Color? defaultBackgroundColor,
    Color? hoverBackgroundColor,
    Color? focusedBackgroundColor,
    Color? activeBackgroundColor,
    Color? disabledBackgroundColor,
    Color? errorBackgroundColor,
    Color? defaultContentColor,
    Color? hoverContentColor,
    Color? focusedContentColor,
    Color? activeContentColor,
    Color? disabledContentColor,
    Color? errorContentColor,
    Color? defaultSecondaryContentColor,
    Color? hoverSecondaryContentColor,
    Color? focusedSecondaryContentColor,
    Color? activeSecondaryContentColor,
    Color? disabledSecondaryContentColor,
    Color? errorSecondaryContentColor,
    Color? defaultBorderColor,
    Color? hoverBorderColor,
    Color? focusedBorderColor,
    Color? activeBorderColor,
    Color? disabledBorderColor,
    Color? errorBorderColor,
  }) {
    var temp = UIKitColorScheme.defaultScheme().copyWith(
      defaultBackgroundColor: defaultBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      focusedBackgroundColor: focusedBackgroundColor,
      activeBackgroundColor: activeBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      errorBackgroundColor: errorBackgroundColor,
      defaultContentColor: defaultContentColor,
      hoverContentColor: hoverContentColor,
      focusedContentColor: focusedContentColor,
      activeContentColor: activeContentColor,
      disabledContentColor: disabledContentColor,
      errorContentColor: errorContentColor,
      defaultSecondaryContentColor: defaultSecondaryContentColor,
      hoverSecondaryContentColor: hoverSecondaryContentColor,
      focusedSecondaryContentColor: focusedSecondaryContentColor,
      activeSecondaryContentColor: activeSecondaryContentColor,
      disabledSecondaryContentColor: disabledSecondaryContentColor,
      errorSecondaryContentColor: errorSecondaryContentColor,
      defaultBorderColor: defaultBorderColor,
      hoverBorderColor: hoverBorderColor,
      focusedBorderColor: focusedBorderColor,
      activeBorderColor: activeBorderColor,
      disabledBorderColor: disabledBorderColor,
      errorBorderColor: errorBorderColor,
    );

    return UIKitColorScheme._(
      defaultBackgroundColor: temp.defaultBackgroundColor,
      hoverBackgroundColor: temp.hoverBackgroundColor,
      focusedBackgroundColor: temp.focusedBackgroundColor,
      activeBackgroundColor: temp.activeBackgroundColor,
      disabledBackgroundColor: temp.disabledBackgroundColor,
      errorBackgroundColor: temp.errorBackgroundColor,
      defaultContentColor: temp.defaultContentColor,
      hoverContentColor: temp.hoverContentColor,
      focusedContentColor: temp.focusedContentColor,
      activeContentColor: temp.activeContentColor,
      disabledContentColor: temp.disabledContentColor,
      errorContentColor: temp.errorContentColor,
      defaultSecondaryContentColor: temp.defaultSecondaryContentColor,
      hoverSecondaryContentColor: temp.hoverSecondaryContentColor,
      focusedSecondaryContentColor: temp.focusedSecondaryContentColor,
      activeSecondaryContentColor: temp.activeSecondaryContentColor,
      disabledSecondaryContentColor: temp.disabledSecondaryContentColor,
      errorSecondaryContentColor: temp.errorSecondaryContentColor,
      defaultBorderColor: temp.defaultBorderColor,
      hoverBorderColor: temp.hoverBorderColor,
      focusedBorderColor: temp.focusedBorderColor,
      activeBorderColor: temp.activeBorderColor,
      disabledBorderColor: temp.disabledBorderColor,
      errorBorderColor: temp.errorBorderColor,
    );
  }

  UIKitColorScheme._({
    this.defaultBackgroundColor,
    this.hoverBackgroundColor,
    this.focusedBackgroundColor,
    this.activeBackgroundColor,
    this.disabledBackgroundColor,
    this.errorBackgroundColor,
    this.defaultContentColor,
    this.hoverContentColor,
    this.focusedContentColor,
    this.activeContentColor,
    this.disabledContentColor,
    this.errorContentColor,
    this.defaultSecondaryContentColor,
    this.hoverSecondaryContentColor,
    this.focusedSecondaryContentColor,
    this.activeSecondaryContentColor,
    this.disabledSecondaryContentColor,
    this.errorSecondaryContentColor,
    this.defaultBorderColor,
    this.hoverBorderColor,
    this.focusedBorderColor,
    this.activeBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
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

  /// Creates a copy of this UIKitColorScheme but with the given fields replaced with
  /// the new values.
  UIKitColorScheme copyWith({
    Color? defaultBackgroundColor,
    Color? hoverBackgroundColor,
    Color? focusedBackgroundColor,
    Color? activeBackgroundColor,
    Color? disabledBackgroundColor,
    Color? errorBackgroundColor,
    Color? defaultContentColor,
    Color? hoverContentColor,
    Color? focusedContentColor,
    Color? activeContentColor,
    Color? disabledContentColor,
    Color? errorContentColor,
    Color? defaultSecondaryContentColor,
    Color? hoverSecondaryContentColor,
    Color? focusedSecondaryContentColor,
    Color? activeSecondaryContentColor,
    Color? disabledSecondaryContentColor,
    Color? errorSecondaryContentColor,
    Color? defaultBorderColor,
    Color? hoverBorderColor,
    Color? focusedBorderColor,
    Color? activeBorderColor,
    Color? disabledBorderColor,
    Color? errorBorderColor,
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
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      defaultContentColor: defaultContentColor ?? this.defaultContentColor,
      hoverContentColor: hoverContentColor ?? this.hoverContentColor,
      focusedContentColor: focusedContentColor ?? this.focusedContentColor,
      activeContentColor: activeContentColor ?? this.activeContentColor,
      disabledContentColor: disabledContentColor ?? this.disabledContentColor,
      errorContentColor: errorContentColor ?? this.errorContentColor,
      defaultSecondaryContentColor:
          defaultSecondaryContentColor ?? this.defaultSecondaryContentColor,
      hoverSecondaryContentColor:
          hoverSecondaryContentColor ?? this.hoverSecondaryContentColor,
      focusedSecondaryContentColor:
          focusedSecondaryContentColor ?? this.focusedSecondaryContentColor,
      activeSecondaryContentColor:
          activeSecondaryContentColor ?? this.activeSecondaryContentColor,
      disabledSecondaryContentColor:
          disabledSecondaryContentColor ?? this.disabledSecondaryContentColor,
      errorSecondaryContentColor:
          errorSecondaryContentColor ?? this.errorSecondaryContentColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
    );
  }

  /// Creates a copy of this UIKitColorScheme but with newScheme values.
  ///
  /// Null values of newScheme sets as defaultScheme.
  UIKitColorScheme copyWithScheme({
    UIKitColorScheme? newScheme,
  }) {
    return copyWith(
      defaultBackgroundColor: newScheme?.defaultBackgroundColor,
      hoverBackgroundColor: newScheme?.hoverBackgroundColor,
      focusedBackgroundColor: newScheme?.focusedBackgroundColor,
      activeBackgroundColor: newScheme?.activeBackgroundColor,
      disabledBackgroundColor: newScheme?.disabledBackgroundColor,
      errorBackgroundColor: newScheme?.errorBackgroundColor,
      defaultContentColor: newScheme?.defaultContentColor,
      hoverContentColor: newScheme?.hoverContentColor,
      focusedContentColor: newScheme?.focusedContentColor,
      activeContentColor: newScheme?.activeContentColor,
      disabledContentColor: newScheme?.disabledContentColor,
      errorContentColor: newScheme?.errorContentColor,
      defaultSecondaryContentColor: newScheme?.defaultSecondaryContentColor,
      hoverSecondaryContentColor: newScheme?.hoverSecondaryContentColor,
      focusedSecondaryContentColor: newScheme?.focusedSecondaryContentColor,
      activeSecondaryContentColor: newScheme?.activeSecondaryContentColor,
      disabledSecondaryContentColor: newScheme?.disabledSecondaryContentColor,
      errorSecondaryContentColor: newScheme?.errorSecondaryContentColor,
      defaultBorderColor: newScheme?.defaultBorderColor,
      hoverBorderColor: newScheme?.hoverBorderColor,
      focusedBorderColor: newScheme?.focusedBorderColor,
      activeBorderColor: newScheme?.activeBorderColor,
      disabledBorderColor: newScheme?.disabledBorderColor,
      errorBorderColor: newScheme?.errorBorderColor,
    );
  }

  // Background
  Color? defaultBackgroundColor;
  Color? hoverBackgroundColor;
  Color? focusedBackgroundColor;
  Color? activeBackgroundColor;
  Color? disabledBackgroundColor;
  Color? errorBackgroundColor;

  // Content
  Color? defaultContentColor;
  Color? hoverContentColor;
  Color? focusedContentColor;
  Color? activeContentColor;
  Color? disabledContentColor;
  Color? errorContentColor;

  // Secondary content
  Color? defaultSecondaryContentColor;
  Color? hoverSecondaryContentColor;
  Color? focusedSecondaryContentColor;
  Color? activeSecondaryContentColor;
  Color? disabledSecondaryContentColor;
  Color? errorSecondaryContentColor;

  // Border
  Color? defaultBorderColor;
  Color? hoverBorderColor;
  Color? focusedBorderColor;
  Color? activeBorderColor;
  Color? disabledBorderColor;
  Color? errorBorderColor;
}
