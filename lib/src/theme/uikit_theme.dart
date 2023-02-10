import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/theme/uikit_checkbox_theme_data.dart';
import 'uikit_menu_item_theme_data.dart';
import 'uikit_text_input_theme_data.dart';
import 'uikit_button_theme_data.dart';
import 'uikit_radio_button_theme_data.dart';
import 'uikit_radio_group_theme_data.dart';
import 'uikit_tab_theme_data.dart';
import 'uikit_toggle_switch_theme_data.dart';

class UIKitTheme extends StatelessWidget {
  const UIKitTheme({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final UIKitThemeData theme;

  /// The widget below this widget in the tree.
  final Widget child;

  static UIKitThemeData of(BuildContext context) {
    final UIKitThemeData? result = maybeOf(context);
    assert(result != null, 'No ThemeData found in context');
    return result!;
  }

  static UIKitThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_UIKitTheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _UIKitTheme(
      data: theme,
      child: child,
    );
  }
}

class _UIKitTheme extends InheritedTheme {
  const _UIKitTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final UIKitThemeData data;

  @override
  bool updateShouldNotify(covariant _UIKitTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _UIKitTheme(data: data, child: child);
  }
}

@immutable
class UIKitThemeData {
  final UIKitButtonThemeData buttonThemeData;
  final UIKitRadioButtonThemeData radioButtonThemeData;
  final UIKitTabThemeData tabThemeData;
  final UIKitToggleSwitchThemeData toggleSwitchThemeData;
  final UIKitRadioGroupThemeData radioGroupThemeData;
  final UIKitTextInputThemeData textInputThemeData;
  final UIKitMenuItemThemeData menuItemThemeData;
  final UIKitCheckboxThemeData checkboxThemeData;

  const UIKitThemeData.raw({
    required this.buttonThemeData,
    required this.radioButtonThemeData,
    required this.tabThemeData,
    required this.toggleSwitchThemeData,
    required this.radioGroupThemeData,
    required this.textInputThemeData,
    required this.menuItemThemeData,
    required this.checkboxThemeData,
  });

  factory UIKitThemeData({
    UIKitButtonThemeData? buttonThemeData,
    UIKitRadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
    UIKitTextInputThemeData? textInputThemeData,
    UIKitMenuItemThemeData? menuItemThemeData,
    UIKitCheckboxThemeData? checkboxThemeData,
  }) {
    buttonThemeData ??= UIKitButtonThemeData();
    radioButtonThemeData ??= UIKitRadioButtonThemeData();
    tabThemeData ??= UIKitTabThemeData();
    toggleSwitchThemeData ??= UIKitToggleSwitchThemeData();
    radioGroupThemeData ??= UIKitRadioGroupThemeData();
    textInputThemeData ??= UIKitTextInputThemeData();
    menuItemThemeData ??= UIKitMenuItemThemeData();
    checkboxThemeData ??= UIKitCheckboxThemeData();

    return UIKitThemeData.raw(
      buttonThemeData: buttonThemeData,
      radioButtonThemeData: radioButtonThemeData,
      tabThemeData: tabThemeData,
      toggleSwitchThemeData: toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData,
      textInputThemeData: textInputThemeData,
      menuItemThemeData: menuItemThemeData,
      checkboxThemeData: checkboxThemeData,
    );
  }

  UIKitThemeData copyWith({
    UIKitButtonThemeData? buttonThemeData,
    UIKitRadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
    UIKitTextInputThemeData? textInputThemeData,
    UIKitMenuItemThemeData? menuItemThemeData,
    UIKitCheckboxThemeData? checkboxThemeData,
  }) {
    return UIKitThemeData.raw(
      buttonThemeData: buttonThemeData ?? this.buttonThemeData,
      radioButtonThemeData: radioButtonThemeData ?? this.radioButtonThemeData,
      tabThemeData: tabThemeData ?? this.tabThemeData,
      toggleSwitchThemeData:
          toggleSwitchThemeData ?? this.toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData ?? this.radioGroupThemeData,
      textInputThemeData: textInputThemeData ?? this.textInputThemeData,
      menuItemThemeData: menuItemThemeData ?? this.menuItemThemeData,
      checkboxThemeData: checkboxThemeData ?? this.checkboxThemeData,
    );
  }
}
