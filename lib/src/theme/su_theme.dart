import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/theme/su_button_theme_data.dart';

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
  final SUButtonThemeData buttonThemeData;

  const SUThemeData.raw({
    required this.buttonThemeData,
  });

  factory SUThemeData({
    SUButtonThemeData? buttonThemeData,
  }) {
    buttonThemeData ??= SUButtonThemeData();

    return SUThemeData.raw(
      buttonThemeData: buttonThemeData,
    );
  }

  SUThemeData copyWith({
    SUButtonThemeData? buttonThemeData,
  }) {
    return SUThemeData.raw(
      buttonThemeData: buttonThemeData ?? this.buttonThemeData,
    );
  }
}
