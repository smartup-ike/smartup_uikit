import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitToggleSwitchThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitToggleSwitchThemeData.raw({
    required this.colorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory UIKitToggleSwitchThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitToggleSwitchThemeData.raw(
      colorScheme: colorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitToggleSwitchThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitToggleSwitchThemeData.raw(
        colorScheme: colorScheme ?? this.colorScheme,
        sizeScheme: sizeScheme ?? this.sizeScheme,
        shadowScheme: shadowScheme ?? this.shadowScheme);
  }
}
