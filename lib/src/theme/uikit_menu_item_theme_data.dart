import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';

@immutable
class UIKitMenuItemThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitMenuItemThemeData.raw({
    required this.colorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory UIKitMenuItemThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitMenuItemThemeData.raw(
      colorScheme: colorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitMenuItemThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitMenuItemThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
