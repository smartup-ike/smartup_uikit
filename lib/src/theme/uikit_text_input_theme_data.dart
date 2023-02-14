import 'package:flutter/material.dart';
import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';

@immutable
class UIKitTextInputThemeData {
  final UIKitColorScheme filledInputColorScheme;
  final UIKitColorScheme lineInputColorScheme;
  final UIKitColorScheme filledSearchColorScheme;
  final UIKitColorScheme lineSearchColorScheme;
  final UIKitSizeScheme smallFilledInputSizeScheme;
  final UIKitSizeScheme smallLineInputSizeScheme;
  final UIKitSizeScheme smallFilledSearchSizeScheme;
  final UIKitSizeScheme smallLineSearchSizeScheme;
  final UIKitSizeScheme mediumFilledInputSizeScheme;
  final UIKitSizeScheme mediumLineInputSizeScheme;
  final UIKitSizeScheme mediumFilledSearchSizeScheme;
  final UIKitSizeScheme mediumLineSearchSizeScheme;
  final UIKitSizeScheme largeFilledInputSizeScheme;
  final UIKitSizeScheme largeLineInputSizeScheme;
  final UIKitSizeScheme largeFilledSearchSizeScheme;
  final UIKitSizeScheme largeLineSearchSizeScheme;
  final UIKitShadowScheme filledInputShadowScheme;
  final UIKitShadowScheme lineInputShadowScheme;
  final UIKitShadowScheme filledSearchShadowScheme;
  final UIKitShadowScheme lineSearchShadowScheme;

  const UIKitTextInputThemeData.raw({
    required this.filledInputColorScheme,
    required this.lineInputColorScheme,
    required this.filledSearchColorScheme,
    required this.lineSearchColorScheme,
    required this.smallFilledInputSizeScheme,
    required this.smallLineInputSizeScheme,
    required this.smallFilledSearchSizeScheme,
    required this.smallLineSearchSizeScheme,
    required this.mediumFilledInputSizeScheme,
    required this.mediumLineInputSizeScheme,
    required this.mediumFilledSearchSizeScheme,
    required this.mediumLineSearchSizeScheme,
    required this.largeFilledInputSizeScheme,
    required this.largeLineInputSizeScheme,
    required this.largeFilledSearchSizeScheme,
    required this.largeLineSearchSizeScheme,
    required this.filledInputShadowScheme,
    required this.lineInputShadowScheme,
    required this.filledSearchShadowScheme,
    required this.lineSearchShadowScheme,
  });

  factory UIKitTextInputThemeData({
    UIKitColorScheme? filledInputcolorScheme,
    UIKitColorScheme? lineInputcolorScheme,
    UIKitColorScheme? filledSearchcolorScheme,
    UIKitColorScheme? lineSearchcolorScheme,
    UIKitSizeScheme? smallFilledInputSizeScheme,
    UIKitSizeScheme? smallLineInputSizeScheme,
    UIKitSizeScheme? smallFilledSearchSizeScheme,
    UIKitSizeScheme? smallLineSearchSizeScheme,
    UIKitSizeScheme? mediumFilledInputSizeScheme,
    UIKitSizeScheme? mediumLineInputSizeScheme,
    UIKitSizeScheme? mediumFilledSearchSizeScheme,
    UIKitSizeScheme? mediumLineSearchSizeScheme,
    UIKitSizeScheme? largeFilledInputSizeScheme,
    UIKitSizeScheme? largeLineInputSizeScheme,
    UIKitSizeScheme? largeFilledSearchSizeScheme,
    UIKitSizeScheme? largeLineSearchSizeScheme,
    UIKitShadowScheme? filledInputShadowScheme,
    UIKitShadowScheme? lineInputShadowScheme,
    UIKitShadowScheme? filledSearchShadowScheme,
    UIKitShadowScheme? lineSearchShadowScheme,
  }) {
    filledInputcolorScheme ??= UIKitColorScheme.defaultScheme();
    lineInputcolorScheme ??= UIKitColorScheme.defaultScheme();
    filledSearchcolorScheme ??= UIKitColorScheme.defaultScheme();
    lineSearchcolorScheme ??= UIKitColorScheme.defaultScheme();
    smallFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    smallLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    smallFilledSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    smallLineSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumFilledSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    mediumLineSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeFilledInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeLineInputSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeFilledSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    largeLineSearchSizeScheme ??= UIKitSizeScheme.defaultScheme();
    filledInputShadowScheme ??= UIKitShadowScheme.defaultScheme();
    lineInputShadowScheme ??= UIKitShadowScheme.defaultScheme();
    filledSearchShadowScheme ??= UIKitShadowScheme.defaultScheme();
    lineSearchShadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitTextInputThemeData.raw(
      filledInputColorScheme: filledInputcolorScheme,
      lineInputColorScheme: lineInputcolorScheme,
      filledSearchColorScheme: filledSearchcolorScheme,
      lineSearchColorScheme: lineSearchcolorScheme,
      smallFilledInputSizeScheme: smallFilledInputSizeScheme,
      smallLineInputSizeScheme: smallLineInputSizeScheme,
      smallFilledSearchSizeScheme: smallFilledSearchSizeScheme,
      smallLineSearchSizeScheme: smallLineSearchSizeScheme,
      mediumFilledInputSizeScheme: mediumFilledInputSizeScheme,
      mediumLineInputSizeScheme: mediumLineInputSizeScheme,
      mediumFilledSearchSizeScheme: mediumFilledSearchSizeScheme,
      mediumLineSearchSizeScheme: mediumLineSearchSizeScheme,
      largeFilledInputSizeScheme: largeFilledInputSizeScheme,
      largeLineInputSizeScheme: largeLineInputSizeScheme,
      largeFilledSearchSizeScheme: largeFilledSearchSizeScheme,
      largeLineSearchSizeScheme: largeLineSearchSizeScheme,
      filledInputShadowScheme: filledInputShadowScheme,
      lineInputShadowScheme: lineInputShadowScheme,
      filledSearchShadowScheme: filledSearchShadowScheme,
      lineSearchShadowScheme: lineSearchShadowScheme,
    );
  }

  UIKitTextInputThemeData copyWith({
    UIKitColorScheme? filledInputcolorScheme,
    UIKitColorScheme? lineInputcolorScheme,
    UIKitColorScheme? filledSearchcolorScheme,
    UIKitColorScheme? lineSearchcolorScheme,
    UIKitSizeScheme? smallFilledInputSizeScheme,
    UIKitSizeScheme? smallLineInputSizeScheme,
    UIKitSizeScheme? smallFilledSearchSizeScheme,
    UIKitSizeScheme? smallLineSearchSizeScheme,
    UIKitSizeScheme? mediumFilledInputSizeScheme,
    UIKitSizeScheme? mediumLineInputSizeScheme,
    UIKitSizeScheme? mediumFilledSearchSizeScheme,
    UIKitSizeScheme? mediumLineSearchSizeScheme,
    UIKitSizeScheme? largeFilledInputSizeScheme,
    UIKitSizeScheme? largeLineInputSizeScheme,
    UIKitSizeScheme? largeFilledSearchSizeScheme,
    UIKitSizeScheme? largeLineSearchSizeScheme,
    UIKitShadowScheme? filledInputShadowScheme,
    UIKitShadowScheme? lineInputShadowScheme,
    UIKitShadowScheme? filledSearchShadowScheme,
    UIKitShadowScheme? lineSearchShadowScheme,
  }) {
    return UIKitTextInputThemeData.raw(
      filledInputColorScheme:
          filledInputcolorScheme ?? this.filledInputColorScheme,
      lineInputColorScheme: lineInputcolorScheme ?? this.lineInputColorScheme,
      filledSearchColorScheme:
          filledSearchcolorScheme ?? this.filledSearchColorScheme,
      lineSearchColorScheme:
          lineSearchcolorScheme ?? this.lineSearchColorScheme,
      smallFilledInputSizeScheme:
          smallFilledInputSizeScheme ?? this.smallFilledInputSizeScheme,
      smallLineInputSizeScheme:
          smallLineInputSizeScheme ?? this.smallLineInputSizeScheme,
      smallFilledSearchSizeScheme:
          smallFilledSearchSizeScheme ?? this.smallFilledSearchSizeScheme,
      smallLineSearchSizeScheme:
          smallLineSearchSizeScheme ?? this.smallLineSearchSizeScheme,
      mediumFilledInputSizeScheme:
          mediumFilledInputSizeScheme ?? this.mediumFilledInputSizeScheme,
      mediumLineInputSizeScheme:
          mediumLineInputSizeScheme ?? this.mediumLineInputSizeScheme,
      mediumFilledSearchSizeScheme:
          mediumFilledSearchSizeScheme ?? this.mediumFilledSearchSizeScheme,
      mediumLineSearchSizeScheme:
          mediumLineSearchSizeScheme ?? this.mediumLineSearchSizeScheme,
      largeFilledInputSizeScheme:
          largeFilledInputSizeScheme ?? this.largeFilledInputSizeScheme,
      largeLineInputSizeScheme:
          largeLineInputSizeScheme ?? this.largeLineInputSizeScheme,
      largeFilledSearchSizeScheme:
          largeFilledSearchSizeScheme ?? this.largeFilledSearchSizeScheme,
      largeLineSearchSizeScheme:
          largeLineSearchSizeScheme ?? this.largeLineSearchSizeScheme,
      filledInputShadowScheme:
          filledInputShadowScheme ?? this.filledInputShadowScheme,
      lineInputShadowScheme:
          lineInputShadowScheme ?? this.lineInputShadowScheme,
      filledSearchShadowScheme:
          filledSearchShadowScheme ?? this.filledSearchShadowScheme,
      lineSearchShadowScheme:
          lineSearchShadowScheme ?? this.lineSearchShadowScheme,
    );
  }
}
