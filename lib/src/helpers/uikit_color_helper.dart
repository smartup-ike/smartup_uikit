import 'package:flutter/material.dart';

class ColorHelper {
  Color? backgroundColor;
  Color? borderColor;
  Color? contentColor;
  Color? secondaryContentColor;
  List<BoxShadow>? shadows;

  ColorHelper({
    this.backgroundColor,
    this.borderColor,
    this.contentColor,
    this.secondaryContentColor,
    this.shadows,
  });
}
