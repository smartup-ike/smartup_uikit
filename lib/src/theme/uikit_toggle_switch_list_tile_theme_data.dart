import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitToggleSwitchListTileThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;
  final UIKitShadowScheme shadowScheme;

  const UIKitToggleSwitchListTileThemeData.raw({
    required this.colorScheme,
    required this.smallSize,
    required this.mediumSize,
    required this.largeSize,
    required this.shadowScheme,
  });

  factory UIKitToggleSwitchListTileThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitToggleSwitchListTileThemeData.raw(
      colorScheme: colorScheme,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
      shadowScheme: shadowScheme,
    );
  }

  UIKitToggleSwitchListTileThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitToggleSwitchListTileThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}