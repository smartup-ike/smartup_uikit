import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

@immutable
class SURadioButtonThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const SURadioButtonThemeData.raw({
    required this.colorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory SURadioButtonThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return SURadioButtonThemeData.raw(
      colorScheme: colorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  SURadioButtonThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return SURadioButtonThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
