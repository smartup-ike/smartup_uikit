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
