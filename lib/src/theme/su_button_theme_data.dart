import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

@immutable
class SUButtonThemeData {
  final UIKitColorScheme primaryColorScheme;
  final UIKitColorScheme secondaryColorScheme;
  final UIKitColorScheme secondaryWhiteColorScheme;
  final UIKitColorScheme tertiaryColorScheme;
  final UIKitColorScheme outlineColorScheme;
  final UIKitColorScheme ghostColorScheme;
  final UIKitColorScheme solidIconColorScheme;
  final UIKitColorScheme ghostIconColorScheme;
  final UIKitSizeScheme sizeScheme;

  const SUButtonThemeData.raw({
    required this.primaryColorScheme,
    required this.secondaryColorScheme,
    required this.secondaryWhiteColorScheme,
    required this.tertiaryColorScheme,
    required this.outlineColorScheme,
    required this.ghostColorScheme,
    required this.solidIconColorScheme,
    required this.ghostIconColorScheme,
    required this.sizeScheme,
  });

  factory SUButtonThemeData({
    UIKitColorScheme? primaryColorScheme,
    UIKitColorScheme? secondaryColorScheme,
    UIKitColorScheme? secondaryWhiteColorScheme,
    UIKitColorScheme? tertiaryColorScheme,
    UIKitColorScheme? outlineColorScheme,
    UIKitColorScheme? ghostColorScheme,
    UIKitColorScheme? solidIconColorScheme,
    UIKitColorScheme? ghostIconColorScheme,
    UIKitSizeScheme? typography,
  }) {
    // Sets default color schemes.
    primaryColorScheme ??= UIKitColorScheme.defaultScheme();
    secondaryColorScheme ??= UIKitColorScheme.defaultScheme();
    secondaryWhiteColorScheme ??= UIKitColorScheme.defaultScheme();
    tertiaryColorScheme ??= UIKitColorScheme.defaultScheme();
    outlineColorScheme ??= UIKitColorScheme.defaultScheme();
    ghostColorScheme ??= UIKitColorScheme.defaultScheme();
    solidIconColorScheme ??= UIKitColorScheme.defaultScheme();
    ghostIconColorScheme ??= UIKitColorScheme.defaultScheme();
    typography ??= UIKitSizeScheme.defaultScheme();

    return SUButtonThemeData.raw(
      primaryColorScheme: primaryColorScheme,
      secondaryColorScheme: secondaryColorScheme,
      secondaryWhiteColorScheme: secondaryWhiteColorScheme,
      tertiaryColorScheme: tertiaryColorScheme,
      outlineColorScheme: outlineColorScheme,
      ghostColorScheme: ghostColorScheme,
      solidIconColorScheme: solidIconColorScheme,
      ghostIconColorScheme: ghostIconColorScheme,
      sizeScheme: typography,
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
    UIKitColorScheme? solidIconColorScheme,
    UIKitColorScheme? ghostIconColorScheme,
    UIKitSizeScheme? sizeScheme,
  }) {
    return SUButtonThemeData.raw(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      secondaryColorScheme: secondaryColorScheme ?? this.secondaryColorScheme,
      secondaryWhiteColorScheme:
          secondaryWhiteColorScheme ?? this.secondaryWhiteColorScheme,
      tertiaryColorScheme: tertiaryColorScheme ?? this.tertiaryColorScheme,
      outlineColorScheme: outlineColorScheme ?? this.outlineColorScheme,
      ghostColorScheme: ghostColorScheme ?? this.ghostColorScheme,
      solidIconColorScheme: solidIconColorScheme ?? this.solidIconColorScheme,
      ghostIconColorScheme: ghostIconColorScheme ?? this.ghostIconColorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
    );
  }
}
