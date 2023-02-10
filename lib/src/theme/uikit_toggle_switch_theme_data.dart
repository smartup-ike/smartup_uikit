import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitToggleSwitchThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme largeSize;
  final UIKitShadowScheme shadowScheme;

  const UIKitToggleSwitchThemeData.raw({
    required this.colorScheme,
    required this.smallSize,
    required this.largeSize,
    required this.shadowScheme,
  });

  factory UIKitToggleSwitchThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitToggleSwitchThemeData.raw(
      colorScheme: colorScheme,
      smallSize: smallSize,
      largeSize: largeSize,
      shadowScheme: shadowScheme,
    );
  }

  UIKitToggleSwitchThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitToggleSwitchThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      smallSize: smallSize ?? this.smallSize,
      largeSize: largeSize ?? this.largeSize,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
