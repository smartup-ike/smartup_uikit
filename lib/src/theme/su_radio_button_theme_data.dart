import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

@immutable
class SURadioButtonThemeData {
  final UIKitColorScheme colorScheme;

  const SURadioButtonThemeData.raw({
    required this.colorScheme,
  });

  factory SURadioButtonThemeData({
    UIKitColorScheme? colorScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();

    return SURadioButtonThemeData.raw(
      colorScheme: colorScheme,
    );
  }

  SURadioButtonThemeData copyWith({
    UIKitColorScheme? colorScheme,
  }) {
    return SURadioButtonThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }
}
