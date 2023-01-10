import 'package:flutter/material.dart';

class UIKitColorScheme {
  UIKitColorScheme({
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
