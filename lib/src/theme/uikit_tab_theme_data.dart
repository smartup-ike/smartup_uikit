import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitTabThemeData {
  final UIKitColorScheme pageTabColorScheme;
  final UIKitColorScheme lineTabColorScheme;
  final UIKitShadowScheme shadowScheme;
  final UIKitSizeScheme sizeScheme;

  const UIKitTabThemeData.raw({
    required this.pageTabColorScheme,
    required this.lineTabColorScheme,
    required this.shadowScheme,
    required this.sizeScheme,
  });

  factory UIKitTabThemeData({
    UIKitColorScheme? pageTabColorScheme,
    UIKitColorScheme? lineTabColorScheme,
    UIKitShadowScheme? shadowScheme,
    UIKitSizeScheme? sizeScheme,
  }) {
    pageTabColorScheme ??= UIKitColorScheme.defaultScheme();
    lineTabColorScheme ??= UIKitColorScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();

    return UIKitTabThemeData.raw(
      pageTabColorScheme: pageTabColorScheme,
      lineTabColorScheme: lineTabColorScheme,
      shadowScheme: shadowScheme,
      sizeScheme: sizeScheme,
    );
  }

  UIKitTabThemeData copyWith({
    UIKitColorScheme? pageTabColorScheme,
    UIKitColorScheme? lineTabColorScheme,
    UIKitShadowScheme? shadowScheme,
    UIKitSizeScheme? sizeScheme,
  }) {
    return UIKitTabThemeData.raw(
      pageTabColorScheme: pageTabColorScheme ?? this.pageTabColorScheme,
      lineTabColorScheme: lineTabColorScheme ?? this.lineTabColorScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
    );
  }
}
