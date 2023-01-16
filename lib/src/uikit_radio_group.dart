import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_shadow_scheme.dart';
import 'package:smartup_uikit/src/theme/su_theme.dart';
import 'theme/uikit_radio_group_theme_data.dart';
import 'uikit_radio_button.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_color_scheme.dart';

class UIKitRadioGroup extends HookWidget {
  const UIKitRadioGroup({
    super.key,
    this.label,
    this.assistiveText,
    this.sizeScheme,
    this.colorScheme,
    this.buttonsColorSheme,
    this.buttonsSizeScheme,
    this.buttonsShadowScheme,
    this.optionLabels,
    this.isVertical,
    required this.getSelected,
  });

  /// [Widget] that is displayed at the top.
  /// Should contain some indication about the content of this radio button group.
  final Widget? label;

  /// [Widget] that is displayed on the bottom.
  /// Should contain information about what this radio button group is for.
  final Widget? assistiveText;

  /// [UIKitSizeScheme] determining the value of different attributes of this
  /// radio button group.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme] determining the value of different color
  /// attributes of this radio button group.
  final UIKitColorScheme? colorScheme;

  /// [UIKitColorScheme] passed to the [UIKitRadioButton] of this group
  final UIKitColorScheme? buttonsColorSheme;

  /// [UIKitSizeScheme] passed to the [UIKitRadioButton] of this group
  final UIKitSizeScheme? buttonsSizeScheme;

  /// [UIKitShadowScheme] passed to the [UIKitRadioButton] of this group
  final UIKitShadowScheme? buttonsShadowScheme;

  /// [List] containing [Widget] that will be used as labels for the
  /// different radio buttons of this group.
  final List<Widget>? optionLabels;

  /// [bool] indicating the layout of this radio button group.
  final bool? isVertical;

  /// [Function]
  /// Set it to (index) => setState(() => _selectedRadioItem = index)
  /// in order to get the index of the selected radio item that you need
  /// in your logic.
  final void Function(int?) getSelected;

  @override
  Widget build(BuildContext context) {
    final selectedIndex$ = useState<int?>(null);
    final themeData = SUTheme.of(context).radioGroupThemeData;

    UIKitColorScheme colorScheme = _defineColors(context, themeData);
    UIKitSizeScheme sizeScheme = _defineSize(context, themeData);
    UIKitColorScheme buttonColorScheme =
        _defineButtonColors(context, themeData);
    UIKitSizeScheme buttonSizeScheme = _defineButtonSize(context, themeData);
    UIKitShadowScheme buttonShadowScheme =
        _defineButtonShadows(context, themeData);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          label!,
          SizedBox(height: sizeScheme.spacing),
        ],
        Wrap(
          spacing: sizeScheme.width ?? 16,
          runSpacing: sizeScheme.height ?? 12,
          children: [
            for (Widget element in optionLabels ?? []) ...[
              Row(
                mainAxisSize:
                    isVertical ?? false ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  UIKitRadioButton(
                    isSelected:
                        selectedIndex$.value == optionLabels?.indexOf(element),
                    onTap: () {
                      selectedIndex$.value = optionLabels?.indexOf(element);
                      getSelected.call(selectedIndex$.value);
                    },
                    colorScheme: buttonColorScheme,
                    sizeScheme: buttonSizeScheme,
                    shadowScheme: buttonShadowScheme,
                  ),
                  SizedBox(width: sizeScheme.spacing),
                  element,
                ],
              ),
            ],
          ],
        ),
        if (assistiveText != null) ...[
          const SizedBox(height: 8),
          assistiveText!
        ],
      ],
    );
  }

  UIKitColorScheme _defineColors(
    BuildContext context,
    UIKitRadioGroupThemeData themeData,
  ) {
    UIKitColorScheme toggleSwitchColors;

    if (colorScheme == null) {
      toggleSwitchColors = themeData.colorScheme;
    } else {
      toggleSwitchColors = colorScheme!;
    }

    return toggleSwitchColors;
  }

  UIKitSizeScheme _defineSize(
    BuildContext context,
    UIKitRadioGroupThemeData themeData,
  ) {
    UIKitSizeScheme toggleSwitchSize;

    if (sizeScheme == null) {
      toggleSwitchSize = themeData.sizeScheme;
    } else {
      toggleSwitchSize = sizeScheme!;
    }
    return toggleSwitchSize;
  }

  UIKitColorScheme _defineButtonColors(
    BuildContext context,
    UIKitRadioGroupThemeData themeData,
  ) {
    UIKitColorScheme toggleSwitchColors;

    if (buttonsColorSheme == null) {
      toggleSwitchColors = themeData.buttonsColorScheme;
    } else {
      toggleSwitchColors = buttonsColorSheme!;
    }

    return toggleSwitchColors;
  }

  UIKitSizeScheme _defineButtonSize(
    BuildContext context,
    UIKitRadioGroupThemeData themeData,
  ) {
    UIKitSizeScheme toggleSwitchSize;

    if (buttonsSizeScheme == null) {
      toggleSwitchSize = themeData.buttonsSizeScheme;
    } else {
      toggleSwitchSize = buttonsSizeScheme!;
    }
    return toggleSwitchSize;
  }

  UIKitShadowScheme _defineButtonShadows(
    BuildContext context,
    UIKitRadioGroupThemeData themeData,
  ) {
    UIKitShadowScheme toggleSwitchShadow;

    if (buttonsShadowScheme == null) {
      toggleSwitchShadow = themeData.buttonsShadowScheme;
    } else {
      toggleSwitchShadow = buttonsShadowScheme!;
    }
    return toggleSwitchShadow;
  }
}
