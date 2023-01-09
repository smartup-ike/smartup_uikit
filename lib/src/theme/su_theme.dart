import 'package:flutter/material.dart';

class SUTheme extends StatelessWidget {
  const SUTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final SUThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  static SUThemeData of(BuildContext context) {
    final SUThemeData? result = maybeOf(context);
    assert(result != null, 'No ThemeData found in context');
    return result!;
  }

  static SUThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_SUTheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _SUTheme(
      data: data,
      child: child,
    );
  }
}

class _SUTheme extends InheritedTheme {
  const _SUTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final SUThemeData data;

  @override
  bool updateShouldNotify(covariant _SUTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _SUTheme(data: data, child: child);
  }
}

@immutable
class SUThemeData {
  final Typography typography;
  final Color activeColor;
  final Color testColor;

  const SUThemeData.raw({
    required this.typography,
    required this.activeColor,
    required this.testColor,
  });

  factory SUThemeData({
    Typography? typography,
    Color? activeColor,
    Color? testColor,
  }) {
    activeColor ??= Colors.white;
    testColor ??= Colors.blue;
    typography ??= Typography();

    return SUThemeData.raw(
      activeColor: activeColor,
      testColor: testColor,
      typography: typography,
    );
  }

  static SUThemeData lerp(SUThemeData a, SUThemeData b, double t) {
    return SUThemeData.raw(
      testColor: Color.lerp(a.activeColor, b.activeColor, t)!,
      typography: Typography.lerp(a.typography, b.typography, t),
      activeColor: Color.lerp(a.activeColor, b.activeColor, t)!,
    );
  }

  SUThemeData copyWith({
    Typography? typography,
    Color? activeColor,
    Color? testColor,
  }) {
    return SUThemeData.raw(
      typography: this.typography,
      testColor: this.testColor,
      activeColor: activeColor ?? this.activeColor,
    );
  }
}
