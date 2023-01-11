import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

@immutable
class SUButtonThemeData {
  final UIKitColorScheme primaryColorScheme;
  final Typography typography;

  const SUButtonThemeData.raw({
    required this.primaryColorScheme,
    required this.typography,
  });

  factory SUButtonThemeData({
    UIKitColorScheme? primaryColorScheme,
    Typography? typography,
  }) {
    primaryColorScheme ??= UIKitColorScheme.defaultScheme();
    typography ??= Typography();

    return SUButtonThemeData.raw(
      primaryColorScheme: primaryColorScheme,
      typography: typography,
    );
  }

  SUButtonThemeData copyWith({
    Typography? typography,
    UIKitColorScheme? primaryColorScheme,
  }) {
    return SUButtonThemeData.raw(
      typography: this.typography,
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
    );
  }
}
