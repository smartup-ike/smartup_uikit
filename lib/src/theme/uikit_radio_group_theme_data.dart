import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitRadioGroupThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitShadowScheme shadowScheme;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;

  const UIKitRadioGroupThemeData.raw({
    required this.colorScheme,
    required this.shadowScheme,
    required this.smallSize,
    required this.mediumSize,
    required this.largeSize,
  });

  factory UIKitRadioGroupThemeData({
    UIKitColorScheme? colorScheme,
    UIKitShadowScheme? shadowScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();

    return UIKitRadioGroupThemeData.raw(
      colorScheme: colorScheme,
      shadowScheme: shadowScheme,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
    );
  }

  UIKitRadioGroupThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitShadowScheme? shadowScheme,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
  }) {
    return UIKitRadioGroupThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
    );
  }
}
