import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

@immutable
class UIKitRadioButtonThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitRadioButtonThemeData.raw({
    required this.colorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory UIKitRadioButtonThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitRadioButtonThemeData.raw(
      colorScheme: colorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitRadioButtonThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitRadioButtonThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
