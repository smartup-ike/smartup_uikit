import 'package:flutter/material.dart';

class UIKitColorScheme {
  UIKitColorScheme({
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

    this.defaultBackgroundColor = temp.defaultBackgroundColor;
    this.hoverBackgroundColor = temp.hoverBackgroundColor;
    this.focusedBackgroundColor = temp.focusedBackgroundColor;
    this.activeBackgroundColor = temp.activeBackgroundColor;
    this.disabledBackgroundColor = temp.disabledBackgroundColor;
    this.defaultContentColor = temp.defaultContentColor;
    this.hoverContentColor = temp.hoverContentColor;
    this.focusedContentColor = temp.focusedContentColor;
    this.activeContentColor = temp.activeContentColor;
    this.disabledContentColor = temp.disabledContentColor;
    this.defaultBorderColor = temp.defaultBorderColor;
    this.hoverBorderColor = temp.hoverBorderColor;
    this.focusedBorderColor = temp.focusedBorderColor;
    this.activeBorderColor = temp.activeBorderColor;
    this.disabledBorderColor = temp.disabledBorderColor;
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
    UIKitColorScheme toCopy = UIKitColorScheme.defaultScheme();

    return UIKitColorScheme._(
      defaultBackgroundColor:
          defaultBackgroundColor ?? toCopy.defaultBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? toCopy.hoverBackgroundColor,
      focusedBackgroundColor:
          focusedBackgroundColor ?? toCopy.focusedBackgroundColor,
      activeBackgroundColor:
          activeBackgroundColor ?? toCopy.activeBackgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? toCopy.disabledBackgroundColor,
      defaultContentColor: defaultContentColor ?? toCopy.defaultContentColor,
      hoverContentColor: hoverContentColor ?? toCopy.hoverContentColor,
      focusedContentColor: focusedContentColor ?? toCopy.focusedContentColor,
      activeContentColor: activeContentColor ?? toCopy.activeContentColor,
      disabledContentColor: disabledContentColor ?? toCopy.disabledContentColor,
      defaultBorderColor: defaultBorderColor ?? toCopy.defaultBorderColor,
      hoverBorderColor: hoverBorderColor ?? toCopy.hoverBorderColor,
      focusedBorderColor: focusedBorderColor ?? toCopy.focusedBorderColor,
      activeBorderColor: activeBorderColor ?? toCopy.activeBorderColor,
      disabledBorderColor: disabledBorderColor ?? toCopy.disabledBorderColor,
    );
  }

  UIKitColorScheme copyWithScheme({
    UIKitColorScheme? newScheme,
  }) {
    UIKitColorScheme toCopy = UIKitColorScheme.defaultScheme();

    return UIKitColorScheme._(
      defaultBackgroundColor:
          newScheme?.defaultBackgroundColor ?? toCopy.defaultBackgroundColor,
      hoverBackgroundColor:
          newScheme?.hoverBackgroundColor ?? toCopy.hoverBackgroundColor,
      focusedBackgroundColor:
          newScheme?.focusedBackgroundColor ?? toCopy.focusedBackgroundColor,
      activeBackgroundColor:
          newScheme?.activeBackgroundColor ?? toCopy.activeBackgroundColor,
      disabledBackgroundColor:
          newScheme?.disabledBackgroundColor ?? toCopy.disabledBackgroundColor,
      defaultContentColor:
          newScheme?.defaultContentColor ?? toCopy.defaultContentColor,
      hoverContentColor:
          newScheme?.hoverContentColor ?? toCopy.hoverContentColor,
      focusedContentColor:
          newScheme?.focusedContentColor ?? toCopy.focusedContentColor,
      activeContentColor:
          newScheme?.activeContentColor ?? toCopy.activeContentColor,
      disabledContentColor:
          newScheme?.disabledContentColor ?? toCopy.disabledContentColor,
      defaultBorderColor:
          newScheme?.defaultBorderColor ?? toCopy.defaultBorderColor,
      hoverBorderColor: newScheme?.hoverBorderColor ?? toCopy.hoverBorderColor,
      focusedBorderColor:
          newScheme?.focusedBorderColor ?? toCopy.focusedBorderColor,
      activeBorderColor:
          newScheme?.activeBorderColor ?? toCopy.activeBorderColor,
      disabledBorderColor:
          newScheme?.disabledBorderColor ?? toCopy.disabledBorderColor,
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
