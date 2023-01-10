import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

@immutable
class SUButtonThemeData {
  final UIKitColorScheme colorScheme;
  final Typography typography;

  const SUButtonThemeData.raw({
    required this.colorScheme,
    required this.typography,
  });

  factory SUButtonThemeData({
    UIKitColorScheme? colorScheme,
    Typography? typography,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    typography ??= Typography();

    return SUButtonThemeData.raw(
      colorScheme: colorScheme,
      typography: typography,
    );
  }

  SUButtonThemeData copyWith({
    Typography? typography,
    UIKitColorScheme? colorScheme,
  }) {
    return SUButtonThemeData.raw(
      typography: this.typography,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }
}
