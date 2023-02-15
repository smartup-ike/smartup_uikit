import 'package:flutter/material.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';
import '../helpers/uikit_color_scheme.dart';

@immutable
class UIKitTabThemeData {
  final UIKitColorScheme pageTabColorScheme;
  final UIKitColorScheme lineTabColorScheme;
  final UIKitShadowScheme pageTabShadowScheme;
  final UIKitShadowScheme lineTabShadowScheme;
  final UIKitSizeScheme pageTabSizeScheme;
  final UIKitSizeScheme lineTabSizeScheme;

  const UIKitTabThemeData.raw({
    required this.pageTabColorScheme,
    required this.lineTabColorScheme,
    required this.pageTabShadowScheme,
    required this.lineTabShadowScheme,
    required this.pageTabSizeScheme,
    required this.lineTabSizeScheme,
  });

  factory UIKitTabThemeData({
    UIKitColorScheme? pageTabColorScheme,
    UIKitColorScheme? lineTabColorScheme,
    UIKitShadowScheme? pageTabShadowScheme,
    UIKitShadowScheme? lineTabShadowScheme,
    UIKitSizeScheme? pageTabSizeScheme,
    UIKitSizeScheme? lineTabSizeScheme,
  }) {
    pageTabColorScheme ??= UIKitColorScheme.defaultScheme();
    lineTabColorScheme ??= UIKitColorScheme.defaultScheme();
    pageTabShadowScheme ??= UIKitShadowScheme.defaultScheme();
    lineTabShadowScheme ??= UIKitShadowScheme.defaultScheme();
    pageTabSizeScheme ??= UIKitSizeScheme.defaultScheme();
    lineTabSizeScheme ??= UIKitSizeScheme.defaultScheme();

    return UIKitTabThemeData.raw(
      pageTabColorScheme: pageTabColorScheme,
      lineTabColorScheme: lineTabColorScheme,
      pageTabShadowScheme: pageTabShadowScheme,
      lineTabShadowScheme: lineTabShadowScheme,
      pageTabSizeScheme: pageTabSizeScheme,
      lineTabSizeScheme: lineTabSizeScheme,
    );
  }

  UIKitTabThemeData copyWith({
    UIKitColorScheme? pageTabColorScheme,
    UIKitColorScheme? lineTabColorScheme,
    UIKitShadowScheme? pageTabShadowScheme,
    UIKitShadowScheme? lineTabShadowScheme,
    UIKitSizeScheme? pageTabSizeScheme,
    UIKitSizeScheme? lineTabSizeScheme,
  }) {
    return UIKitTabThemeData.raw(
      pageTabColorScheme: pageTabColorScheme ?? this.pageTabColorScheme,
      lineTabColorScheme: lineTabColorScheme ?? this.lineTabColorScheme,
      pageTabShadowScheme: pageTabShadowScheme ?? this.pageTabShadowScheme,
      lineTabShadowScheme: lineTabShadowScheme ?? this.lineTabShadowScheme,
      pageTabSizeScheme: pageTabSizeScheme ?? this.pageTabSizeScheme,
      lineTabSizeScheme: lineTabSizeScheme ?? this.lineTabSizeScheme,
    );
  }
}
