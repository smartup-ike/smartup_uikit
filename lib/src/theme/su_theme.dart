import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/theme/su_button_theme_data.dart';
import 'package:smartup_uikit/src/theme/su_radio_button_theme_data.dart';
import 'package:smartup_uikit/src/theme/uikit_radio_group_theme_data.dart';
import 'package:smartup_uikit/src/theme/uikit_tab_theme_data.dart';
import 'package:smartup_uikit/src/theme/uikit_toggle_switch_theme_data.dart';

class SUTheme extends StatelessWidget {
  const SUTheme({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final SUThemeData theme;

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
      data: theme,
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
  final SURadioButtonThemeData radioButtonThemeData;
  final UIKitTabThemeData tabThemeData;
  final UIKitToggleSwitchThemeData toggleSwitchThemeData;
  final UIKitRadioGroupThemeData radioGroupThemeData;

  const SUThemeData.raw({
    required this.buttonThemeData,
    required this.radioButtonThemeData,
    required this.tabThemeData,
    required this.toggleSwitchThemeData,
    required this.radioGroupThemeData,
  });

  factory SUThemeData({
    SUButtonThemeData? buttonThemeData,
    SURadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
  }) {
    buttonThemeData ??= SUButtonThemeData();
    radioButtonThemeData ??= SURadioButtonThemeData();
    tabThemeData ??= UIKitTabThemeData();
    toggleSwitchThemeData ??= UIKitToggleSwitchThemeData();
    radioGroupThemeData ??= UIKitRadioGroupThemeData();

    return SUThemeData.raw(
      buttonThemeData: buttonThemeData,
      radioButtonThemeData: radioButtonThemeData,
      tabThemeData: tabThemeData,
      toggleSwitchThemeData: toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData,
    );
  }

  SUThemeData copyWith({
    SUButtonThemeData? buttonThemeData,
    SURadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
  }) {
    return SUThemeData.raw(
      buttonThemeData: buttonThemeData ?? this.buttonThemeData,
      radioButtonThemeData: radioButtonThemeData ?? this.radioButtonThemeData,
      tabThemeData: tabThemeData ?? this.tabThemeData,
      toggleSwitchThemeData:
          toggleSwitchThemeData ?? this.toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData ?? this.radioGroupThemeData,
    );
  }
}
