import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';

@immutable
class UIKitDropdownButtonThemeData {
  final UIKitColorScheme filledInputColorScheme;
  final UIKitColorScheme lineInputColorScheme;
  final UIKitSizeScheme smallFilledInputSizeScheme;
  final UIKitSizeScheme smallFilledDropDownSizeScheme;
  final UIKitSizeScheme smallLineInputSizeScheme;
  final UIKitSizeScheme mediumFilledInputSizeScheme;
  final UIKitSizeScheme mediumFilledDropDownSizeScheme;
  final UIKitSizeScheme mediumLineInputSizeScheme;
  final UIKitSizeScheme largeFilledInputSizeScheme;
  final UIKitSizeScheme largeFilledDropDownSizeScheme;
  final UIKitSizeScheme largeLineInputSizeScheme;
  final UIKitShadowScheme filledInputShadowScheme;
  final UIKitShadowScheme lineInputShadowScheme;

  const UIKitDropdownButtonThemeData.raw({
    required this.filledInputColorScheme,
    required this.lineInputColorScheme,
    required this.smallFilledInputSizeScheme,
    required this.smallLineInputSizeScheme,
    required this.mediumFilledInputSizeScheme,
    required this.mediumLineInputSizeScheme,
    required this.largeFilledInputSizeScheme,
    required this.largeLineInputSizeScheme,
    required this.filledInputShadowScheme,
    required this.lineInputShadowScheme,
    required this.largeFilledDropDownSizeScheme,
    required this.mediumFilledDropDownSizeScheme,
    required this.smallFilledDropDownSizeScheme,
  });

  factory UIKitDropdownButtonThemeData({
    UIKitColorScheme? filledInputColorScheme,
    UIKitColorScheme? lineInputColorScheme,
    UIKitSizeScheme? smallFilledInputSizeScheme,
    UIKitSizeScheme? smallFilledDropDownSizeScheme,
    UIKitSizeScheme? smallLineInputSizeScheme,
    UIKitSizeScheme? mediumFilledInputSizeScheme,
    UIKitSizeScheme? mediumFilledDropDownSizeScheme,
    UIKitSizeScheme? mediumLineInputSizeScheme,
    UIKitSizeScheme? largeFilledInputSizeScheme,
    UIKitSizeScheme? largeFilledDropDownSizeScheme,
    UIKitSizeScheme? largeLineInputSizeScheme,
    UIKitShadowScheme? filledInputShadowScheme,
    UIKitShadowScheme? lineInputShadowScheme,
  }) {
    filledInputColorScheme ??= UIKitColorScheme.defaultScheme();
    lineInputColorScheme ??= UIKitColorScheme.defaultScheme();
    smallFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    smallFilledDropDownSizeScheme ??= UIKitSizeScheme.defaultScheme();
    smallLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumFilledDropDownSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeFilledDropDownSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    filledInputShadowScheme ??= UIKitShadowScheme.defaultScheme();
    lineInputShadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitDropdownButtonThemeData.raw(
      filledInputColorScheme: filledInputColorScheme,
      lineInputColorScheme: lineInputColorScheme,
      smallFilledInputSizeScheme: smallFilledInputSizeScheme,
      smallFilledDropDownSizeScheme: smallFilledDropDownSizeScheme,
      smallLineInputSizeScheme: smallLineInputSizeScheme,
      mediumFilledInputSizeScheme: mediumFilledInputSizeScheme,
      mediumFilledDropDownSizeScheme: mediumFilledDropDownSizeScheme,
      mediumLineInputSizeScheme: mediumLineInputSizeScheme,
      largeFilledInputSizeScheme: largeFilledInputSizeScheme,
      largeFilledDropDownSizeScheme: largeFilledDropDownSizeScheme,
      largeLineInputSizeScheme: largeLineInputSizeScheme,
      filledInputShadowScheme: filledInputShadowScheme,
      lineInputShadowScheme: lineInputShadowScheme,
    );
  }

  UIKitDropdownButtonThemeData copyWith({
    UIKitColorScheme? filledInputColorScheme,
    UIKitColorScheme? lineInputColorScheme,
    UIKitSizeScheme? smallFilledInputSizeScheme,
    UIKitSizeScheme? smallFilledDropDownSizeScheme,
    UIKitSizeScheme? smallLineInputSizeScheme,
    UIKitSizeScheme? mediumFilledInputSizeScheme,
    UIKitSizeScheme? mediumFilledDropDownSizeScheme,
    UIKitSizeScheme? mediumLineInputSizeScheme,
    UIKitSizeScheme? largeFilledInputSizeScheme,
    UIKitSizeScheme? largeFilledDropDownSizeScheme,
    UIKitSizeScheme? largeLineInputSizeScheme,
    UIKitShadowScheme? filledInputShadowScheme,
    UIKitShadowScheme? lineInputShadowScheme,
  }) {
    return UIKitDropdownButtonThemeData.raw(
      filledInputColorScheme:
          filledInputColorScheme ?? this.filledInputColorScheme,
      lineInputColorScheme: lineInputColorScheme ?? this.lineInputColorScheme,
      smallFilledInputSizeScheme:
          smallFilledInputSizeScheme ?? this.smallFilledInputSizeScheme,
      smallFilledDropDownSizeScheme:
          smallFilledDropDownSizeScheme ?? this.smallFilledDropDownSizeScheme,
      smallLineInputSizeScheme:
          smallLineInputSizeScheme ?? this.smallLineInputSizeScheme,
      mediumFilledInputSizeScheme:
          mediumFilledInputSizeScheme ?? this.mediumFilledInputSizeScheme,
      mediumFilledDropDownSizeScheme:
          mediumFilledDropDownSizeScheme ?? this.mediumFilledDropDownSizeScheme,
      mediumLineInputSizeScheme:
          mediumLineInputSizeScheme ?? this.mediumLineInputSizeScheme,
      largeFilledInputSizeScheme:
          largeFilledInputSizeScheme ?? this.largeFilledInputSizeScheme,
      largeFilledDropDownSizeScheme:
          largeFilledDropDownSizeScheme ?? this.largeFilledDropDownSizeScheme,
      largeLineInputSizeScheme:
          largeLineInputSizeScheme ?? this.largeLineInputSizeScheme,
      filledInputShadowScheme:
          filledInputShadowScheme ?? this.filledInputShadowScheme,
      lineInputShadowScheme:
          lineInputShadowScheme ?? this.lineInputShadowScheme,
    );
  }
}
