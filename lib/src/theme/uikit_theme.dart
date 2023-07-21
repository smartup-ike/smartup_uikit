import 'package:flutter/material.dart';
import '../../smartup_uikit.dart';

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
  final UIKitColors colors;
  final UIKitTypography typography;
  final UIKitButtonThemeData buttonThemeData;
  final UIKitRadioButtonThemeData radioButtonThemeData;
  final UIKitTabThemeData tabThemeData;
  final UIKitToggleSwitchThemeData toggleSwitchThemeData;
  final UIKitRadioGroupThemeData radioGroupThemeData;
  final UIKitTextInputThemeData textInputThemeData;
  final UIKitMenuItemThemeData menuItemThemeData;
  final UIKitDropdownMenuThemeData dropdownMenuThemeData;
  final UIKitCalendarButtonThemeData calendarButtonThemeData;
  final UIKitDatePickerThemeData datePickerThemeData;
  final UIKitCheckBoxListTileThemeData checkboxThemeData;
  final UIKitToggleListTileThemeData toggleListTileThemeData;

  const UIKitThemeData.raw({
    required this.colors,
    required this.typography,
    required this.buttonThemeData,
    required this.radioButtonThemeData,
    required this.tabThemeData,
    required this.toggleSwitchThemeData,
    required this.radioGroupThemeData,
    required this.textInputThemeData,
    required this.menuItemThemeData,
    required this.dropdownMenuThemeData,
    required this.calendarButtonThemeData,
    required this.datePickerThemeData,
    required this.checkboxThemeData,
    required this.toggleListTileThemeData,
  });

  factory UIKitThemeData({
    UIKitColors? colors,
    UIKitTypography? typography,
    UIKitButtonThemeData? buttonThemeData,
    UIKitRadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
    UIKitTextInputThemeData? textInputThemeData,
    UIKitMenuItemThemeData? menuItemThemeData,
    UIKitDropdownMenuThemeData? dropdownMenuThemeData,
    UIKitCalendarButtonThemeData? calendarButtonThemeData,
    UIKitDatePickerThemeData? datePickerThemeData,
    UIKitCheckBoxListTileThemeData? checkboxThemeData,
    UIKitToggleListTileThemeData? toggleListTileThemeData,
  }) {
    colors ??= const UIKitColors();
    typography ??= const UIKitTypography();
    buttonThemeData ??= UIKitButtonThemeData();
    radioButtonThemeData ??= UIKitRadioButtonThemeData();
    tabThemeData ??= UIKitTabThemeData();
    toggleSwitchThemeData ??= UIKitToggleSwitchThemeData();
    radioGroupThemeData ??= UIKitRadioGroupThemeData();
    textInputThemeData ??= UIKitTextInputThemeData();
    menuItemThemeData ??= UIKitMenuItemThemeData();
    dropdownMenuThemeData ??= UIKitDropdownMenuThemeData();
    calendarButtonThemeData ??= UIKitCalendarButtonThemeData();
    datePickerThemeData ??= UIKitDatePickerThemeData();
    checkboxThemeData ??= UIKitCheckBoxListTileThemeData();
    toggleListTileThemeData ??= UIKitToggleListTileThemeData();

    return UIKitThemeData.raw(
      colors: colors,
      typography: typography,
      buttonThemeData: buttonThemeData,
      radioButtonThemeData: radioButtonThemeData,
      tabThemeData: tabThemeData,
      toggleSwitchThemeData: toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData,
      textInputThemeData: textInputThemeData,
      menuItemThemeData: menuItemThemeData,
      dropdownMenuThemeData: dropdownMenuThemeData,
      calendarButtonThemeData: calendarButtonThemeData,
      datePickerThemeData: datePickerThemeData,
      checkboxThemeData: checkboxThemeData,
      toggleListTileThemeData: toggleListTileThemeData,
    );
  }

  UIKitThemeData copyWith({
    UIKitColors? colors,
    UIKitTypography? typography,
    UIKitButtonThemeData? buttonThemeData,
    UIKitRadioButtonThemeData? radioButtonThemeData,
    UIKitTabThemeData? tabThemeData,
    UIKitToggleSwitchThemeData? toggleSwitchThemeData,
    UIKitRadioGroupThemeData? radioGroupThemeData,
    UIKitTextInputThemeData? textInputThemeData,
    UIKitMenuItemThemeData? menuItemThemeData,
    UIKitDropdownMenuThemeData? dropdownMenuThemeData,
    UIKitCalendarButtonThemeData? calendarButtonThemeData,
    UIKitDatePickerThemeData? datePickerThemeData,
    UIKitCheckBoxListTileThemeData? checkboxThemeData,
    UIKitToggleListTileThemeData? toggleListTileThemeData,
  }) {
    return UIKitThemeData.raw(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      buttonThemeData: buttonThemeData ?? this.buttonThemeData,
      radioButtonThemeData: radioButtonThemeData ?? this.radioButtonThemeData,
      tabThemeData: tabThemeData ?? this.tabThemeData,
      toggleSwitchThemeData:
          toggleSwitchThemeData ?? this.toggleSwitchThemeData,
      radioGroupThemeData: radioGroupThemeData ?? this.radioGroupThemeData,
      textInputThemeData: textInputThemeData ?? this.textInputThemeData,
      menuItemThemeData: menuItemThemeData ?? this.menuItemThemeData,
      dropdownMenuThemeData:
          dropdownMenuThemeData ?? this.dropdownMenuThemeData,
      calendarButtonThemeData:
          calendarButtonThemeData ?? this.calendarButtonThemeData,
      datePickerThemeData: datePickerThemeData ?? this.datePickerThemeData,
        checkboxThemeData: checkboxThemeData ?? this.checkboxThemeData,
      toggleListTileThemeData: toggleListTileThemeData ?? this.toggleListTileThemeData,

    );
  }
}