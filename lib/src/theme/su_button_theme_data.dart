import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

@immutable
class SUButtonThemeData {
  final UIKitColorScheme primaryColorScheme;
  final UIKitColorScheme secondaryColorScheme;
  final UIKitColorScheme secondaryWhiteColorScheme;
  final UIKitColorScheme tertiaryColorScheme;
  final UIKitColorScheme outlineColorScheme;
  final UIKitColorScheme ghostColorScheme;
  final Typography typography;

  const SUButtonThemeData.raw({
    required this.primaryColorScheme,
    required this.secondaryColorScheme,
    required this.secondaryWhiteColorScheme,
    required this.tertiaryColorScheme,
    required this.outlineColorScheme,
    required this.ghostColorScheme,
    required this.typography,
  });

  factory SUButtonThemeData({
    UIKitColorScheme? primaryColorScheme,
    UIKitColorScheme? secondaryColorScheme,
    UIKitColorScheme? secondaryWhiteColorScheme,
    UIKitColorScheme? tertiaryColorScheme,
    UIKitColorScheme? outlineColorScheme,
    UIKitColorScheme? ghostColorScheme,
    Typography? typography,
  }) {
    // Sets default color schemes.
    primaryColorScheme ??= UIKitColorScheme.defaultScheme();
    secondaryColorScheme ??= UIKitColorScheme.defaultScheme();
    secondaryWhiteColorScheme ??= UIKitColorScheme.defaultScheme();
    tertiaryColorScheme ??= UIKitColorScheme.defaultScheme();
    outlineColorScheme ??= UIKitColorScheme.defaultScheme();
    ghostColorScheme ??= UIKitColorScheme.defaultScheme();
    typography ??= Typography();

    return SUButtonThemeData.raw(
      primaryColorScheme: primaryColorScheme,
      secondaryColorScheme: secondaryColorScheme,
      secondaryWhiteColorScheme: secondaryWhiteColorScheme,
      tertiaryColorScheme: tertiaryColorScheme,
      outlineColorScheme: outlineColorScheme,
      ghostColorScheme: ghostColorScheme,
      typography: typography,
    );
  }

  /// Creates a copy of this [SUButtonThemeData] but with the given fields replaced with
  /// the new values.
  SUButtonThemeData copyWith({
    UIKitColorScheme? primaryColorScheme,
    UIKitColorScheme? secondaryColorScheme,
    UIKitColorScheme? secondaryWhiteColorScheme,
    UIKitColorScheme? tertiaryColorScheme,
    UIKitColorScheme? outlineColorScheme,
    UIKitColorScheme? ghostColorScheme,
    Typography? typography,
  }) {
    return SUButtonThemeData.raw(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      secondaryColorScheme: secondaryColorScheme ?? this.secondaryColorScheme,
      secondaryWhiteColorScheme:
          secondaryWhiteColorScheme ?? this.secondaryWhiteColorScheme,
      tertiaryColorScheme: tertiaryColorScheme ?? this.tertiaryColorScheme,
      outlineColorScheme: outlineColorScheme ?? this.outlineColorScheme,
      ghostColorScheme: ghostColorScheme ?? this.ghostColorScheme,
      typography: this.typography,
    );
  }
}
