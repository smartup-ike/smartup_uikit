import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';

@immutable
class UIKitTextInputThemeData {
  final UIKitColorScheme filledInputcolorScheme;
  final UIKitColorScheme lineInputcolorScheme;
  final UIKitColorScheme filledSearchcolorScheme;
  final UIKitColorScheme lineSearchcolorScheme;
  final UIKitSizeScheme inputSizeScheme;
  final UIKitSizeScheme searchSizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitTextInputThemeData.raw({
    required this.filledInputcolorScheme,
    required this.lineInputcolorScheme,
    required this.filledSearchcolorScheme,
    required this.lineSearchcolorScheme,
    required this.inputSizeScheme,
    required this.searchSizeScheme,
    required this.shadowScheme,
  });

  factory UIKitTextInputThemeData({
    UIKitColorScheme? filledInputcolorScheme,
    UIKitColorScheme? lineInputcolorScheme,
    UIKitColorScheme? filledSearchcolorScheme,
    UIKitColorScheme? lineSearchcolorScheme,
    UIKitSizeScheme? inputSizeScheme,
    UIKitSizeScheme? searchSizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    filledInputcolorScheme ??= UIKitColorScheme.defaultScheme();
    lineInputcolorScheme ??= UIKitColorScheme.defaultScheme();
    filledSearchcolorScheme ??= UIKitColorScheme.defaultScheme();
    lineSearchcolorScheme ??= UIKitColorScheme.defaultScheme();
    inputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    searchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitTextInputThemeData.raw(
      filledInputcolorScheme: filledInputcolorScheme,
      lineInputcolorScheme: lineInputcolorScheme,
      filledSearchcolorScheme: filledSearchcolorScheme,
      lineSearchcolorScheme: lineSearchcolorScheme,
      inputSizeScheme: inputSizeScheme,
      searchSizeScheme: searchSizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitTextInputThemeData copyWith({
    UIKitColorScheme? filledInputcolorScheme,
    UIKitColorScheme? lineInputcolorScheme,
    UIKitColorScheme? filledSearchcolorScheme,
    UIKitColorScheme? lineSearchcolorScheme,
    UIKitSizeScheme? inputSizeScheme,
    UIKitSizeScheme? searchSizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitTextInputThemeData.raw(
      filledInputcolorScheme:
          filledInputcolorScheme ?? this.filledInputcolorScheme,
      lineInputcolorScheme: lineInputcolorScheme ?? this.lineInputcolorScheme,
      filledSearchcolorScheme:
          filledSearchcolorScheme ?? this.filledSearchcolorScheme,
      lineSearchcolorScheme:
          lineSearchcolorScheme ?? this.lineSearchcolorScheme,
      inputSizeScheme: inputSizeScheme ?? this.inputSizeScheme,
      searchSizeScheme: searchSizeScheme ?? this.searchSizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
