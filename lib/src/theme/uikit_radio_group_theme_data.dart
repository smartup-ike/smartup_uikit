import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitRadioGroupThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitColorScheme buttonsColorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitSizeScheme buttonsSizeScheme;
  final UIKitShadowScheme buttonsShadowScheme;

  const UIKitRadioGroupThemeData.raw({
    required this.colorScheme,
    required this.buttonsColorScheme,
    required this.sizeScheme,
    required this.buttonsSizeScheme,
    required this.buttonsShadowScheme,
  });

  factory UIKitRadioGroupThemeData({
    UIKitColorScheme? colorScheme,
    UIKitColorScheme? buttonsColorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitSizeScheme? buttonsSizeScheme,
    UIKitShadowScheme? buttonsShadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    buttonsColorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    buttonsSizeScheme ??= UIKitSizeScheme.defaultScheme();
    buttonsShadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitRadioGroupThemeData.raw(
      colorScheme: colorScheme,
      buttonsColorScheme: buttonsColorScheme,
      sizeScheme: sizeScheme,
      buttonsSizeScheme: buttonsSizeScheme,
      buttonsShadowScheme: buttonsShadowScheme,
    );
  }

  UIKitRadioGroupThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitColorScheme? buttonsColorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitSizeScheme? buttonsSizeScheme,
    UIKitShadowScheme? buttonsShadowScheme,
  }) {
    return UIKitRadioGroupThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      buttonsColorScheme: buttonsColorScheme ?? this.buttonsColorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      buttonsSizeScheme: buttonsSizeScheme ?? this.buttonsSizeScheme,
      buttonsShadowScheme: buttonsShadowScheme ?? this.buttonsShadowScheme,
    );
  }
}
