import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

@immutable
class UIKitButtonThemeData {
  final UIKitColorScheme primaryColors;
  final UIKitColorScheme secondaryColors;
  final UIKitColorScheme secondaryWhiteColors;
  final UIKitColorScheme tertiaryColors;
  final UIKitColorScheme outlineColors;
  final UIKitColorScheme ghostColors;
  final UIKitColorScheme solidIconColors;
  final UIKitColorScheme ghostIconColors;
  final UIKitShadowScheme primaryShadows;
  final UIKitShadowScheme secondaryShadows;
  final UIKitShadowScheme secondaryWhiteShadows;
  final UIKitShadowScheme tertiaryShadows;
  final UIKitShadowScheme outlineShadows;
  final UIKitShadowScheme ghostShadows;
  final UIKitShadowScheme solidIconShadows;
  final UIKitShadowScheme ghostIconShadows;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;
  final UIKitSizeScheme smallIconSize;
  final UIKitSizeScheme mediumIconSize;
  final UIKitSizeScheme largeIconSize;

  const UIKitButtonThemeData.raw({
    required this.primaryColors,
    required this.secondaryColors,
    required this.secondaryWhiteColors,
    required this.tertiaryColors,
    required this.outlineColors,
    required this.ghostColors,
    required this.solidIconColors,
    required this.ghostIconColors,
    required this.primaryShadows,
    required this.secondaryShadows,
    required this.secondaryWhiteShadows,
    required this.tertiaryShadows,
    required this.outlineShadows,
    required this.ghostShadows,
    required this.solidIconShadows,
    required this.ghostIconShadows,
    required this.smallSize,
    required this.mediumSize,
    required this.largeSize,
    required this.smallIconSize,
    required this.mediumIconSize,
    required this.largeIconSize,
  });

  factory UIKitButtonThemeData({
    UIKitColorScheme? primaryColors,
    UIKitColorScheme? secondaryColors,
    UIKitColorScheme? secondaryWhiteColors,
    UIKitColorScheme? tertiaryColors,
    UIKitColorScheme? outlineColors,
    UIKitColorScheme? ghostColors,
    UIKitColorScheme? solidIconColors,
    UIKitColorScheme? ghostIconColors,
    UIKitShadowScheme? primaryShadows,
    UIKitShadowScheme? secondaryShadows,
    UIKitShadowScheme? secondaryWhiteShadows,
    UIKitShadowScheme? tertiaryShadows,
    UIKitShadowScheme? outlineShadows,
    UIKitShadowScheme? ghostShadows,
    UIKitShadowScheme? solidIconShadows,
    UIKitShadowScheme? ghostIconShadows,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitSizeScheme? smallIconSize,
    UIKitSizeScheme? mediumIconSize,
    UIKitSizeScheme? largeIconSize,
  }) {
    // Sets default color schemes.
    primaryColors ??= UIKitColorScheme.defaultScheme();
    secondaryColors ??= UIKitColorScheme.defaultScheme();
    secondaryWhiteColors ??= UIKitColorScheme.defaultScheme();
    tertiaryColors ??= UIKitColorScheme.defaultScheme();
    outlineColors ??= UIKitColorScheme.defaultScheme();
    ghostColors ??= UIKitColorScheme.defaultScheme();
    solidIconColors ??= UIKitColorScheme.defaultScheme();
    ghostIconColors ??= UIKitColorScheme.defaultScheme();
    primaryShadows ??= UIKitShadowScheme.defaultScheme();
    secondaryShadows ??= UIKitShadowScheme.defaultScheme();
    secondaryWhiteShadows ??= UIKitShadowScheme.defaultScheme();
    tertiaryShadows ??= UIKitShadowScheme.defaultScheme();
    outlineShadows ??= UIKitShadowScheme.defaultScheme();
    ghostShadows ??= UIKitShadowScheme.defaultScheme();
    solidIconShadows ??= UIKitShadowScheme.defaultScheme();
    ghostIconShadows ??= UIKitShadowScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    smallIconSize ??= UIKitSizeScheme.defaultScheme();
    mediumIconSize ??= UIKitSizeScheme.defaultScheme();
    largeIconSize ??= UIKitSizeScheme.defaultScheme();

    return UIKitButtonThemeData.raw(
      primaryColors: primaryColors,
      secondaryColors: secondaryColors,
      secondaryWhiteColors: secondaryWhiteColors,
      tertiaryColors: tertiaryColors,
      outlineColors: outlineColors,
      ghostColors: ghostColors,
      solidIconColors: solidIconColors,
      ghostIconColors: ghostIconColors,
      primaryShadows: primaryShadows,
      secondaryShadows: secondaryShadows,
      secondaryWhiteShadows: secondaryWhiteShadows,
      tertiaryShadows: tertiaryShadows,
      outlineShadows: outlineShadows,
      ghostShadows: ghostShadows,
      solidIconShadows: solidIconShadows,
      ghostIconShadows: ghostIconShadows,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
      smallIconSize: smallIconSize,
      mediumIconSize: mediumIconSize,
      largeIconSize: largeIconSize,
    );
  }

  /// Creates a copy of this [UIKitButtonThemeData] but with the given fields replaced with
  /// the new values.
  UIKitButtonThemeData copyWith({
    UIKitColorScheme? primaryColors,
    UIKitColorScheme? secondaryColors,
    UIKitColorScheme? secondaryWhiteColors,
    UIKitColorScheme? tertiaryColors,
    UIKitColorScheme? outlineColors,
    UIKitColorScheme? ghostColors,
    UIKitColorScheme? solidIconColors,
    UIKitColorScheme? ghostIconColors,
    UIKitShadowScheme? primaryShadows,
    UIKitShadowScheme? secondaryShadows,
    UIKitShadowScheme? secondaryWhiteShadows,
    UIKitShadowScheme? tertiaryShadows,
    UIKitShadowScheme? outlineShadows,
    UIKitShadowScheme? ghostShadows,
    UIKitShadowScheme? solidIconShadows,
    UIKitShadowScheme? ghostIconShadows,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitSizeScheme? smallIconSize,
    UIKitSizeScheme? mediumIconSize,
    UIKitSizeScheme? largeIconSize,
  }) {
    return UIKitButtonThemeData.raw(
      primaryColors: primaryColors ?? this.primaryColors,
      secondaryColors: secondaryColors ?? this.secondaryColors,
      secondaryWhiteColors: secondaryWhiteColors ?? this.secondaryWhiteColors,
      tertiaryColors: tertiaryColors ?? this.tertiaryColors,
      outlineColors: outlineColors ?? this.outlineColors,
      ghostColors: ghostColors ?? this.ghostColors,
      solidIconColors: solidIconColors ?? this.solidIconColors,
      ghostIconColors: ghostIconColors ?? this.ghostIconColors,
      primaryShadows: primaryShadows ?? this.primaryShadows,
      secondaryShadows: secondaryShadows ?? this.secondaryShadows,
      secondaryWhiteShadows:
          secondaryWhiteShadows ?? this.secondaryWhiteShadows,
      tertiaryShadows: tertiaryShadows ?? this.tertiaryShadows,
      outlineShadows: outlineShadows ?? this.outlineShadows,
      ghostShadows: ghostShadows ?? this.ghostShadows,
      solidIconShadows: solidIconShadows ?? this.solidIconShadows,
      ghostIconShadows: ghostIconShadows ?? this.ghostIconShadows,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
      smallIconSize: smallIconSize ?? this.smallIconSize,
      mediumIconSize: mediumIconSize ?? this.mediumIconSize,
      largeIconSize: largeIconSize ?? this.largeIconSize,
    );
  }
}
