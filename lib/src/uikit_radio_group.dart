import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_icon_theme.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_theme.dart';
import 'theme/uikit_radio_group_theme_data.dart';
import 'uikit_radio_button.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_color_scheme.dart';

class UIKitRadioGroup extends HookWidget {
  const UIKitRadioGroup({
    super.key,
    this.size,
    this.initialSelectedIndex,
    this.label,
    this.assistiveText,
    this.errorIcon,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.optionLabels,
    this.isVertical,
    this.hasError,
    this.onTap,
  }) : assert(
          size == null,
          'Must be null by default. Use named constructors to set its value',
        );

  const UIKitRadioGroup.small({
    super.key,
    this.initialSelectedIndex,
    this.label,
    this.assistiveText,
    this.errorIcon,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.optionLabels,
    this.isVertical,
    this.hasError,
    this.onTap,
  }) : size = UIKitSizes.small;

  const UIKitRadioGroup.medium({
    super.key,
    this.initialSelectedIndex,
    this.label,
    this.assistiveText,
    this.errorIcon,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.optionLabels,
    this.isVertical,
    this.hasError,
    this.onTap,
  }) : size = UIKitSizes.medium;

  const UIKitRadioGroup.large({
    super.key,
    this.initialSelectedIndex,
    this.label,
    this.assistiveText,
    this.errorIcon,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
    this.optionLabels,
    this.isVertical,
    this.hasError,
    this.onTap,
  }) : size = UIKitSizes.large;

  /// [UIKitSizes] determining the size of this widget.
  /// Must be null by default.
  /// Use named constructors to set its value.
  final UIKitSizes? size;

  /// [int] that assigns the selected item when the widget is first built.
  final int? initialSelectedIndex;

  /// [Widget] that is displayed at the top.
  /// Should contain some indication about the content of this radio button group.
  final Widget? label;

  /// [Widget] that is displayed on the bottom.
  /// Should contain information about what this radio button group is for or
  /// error info when the [hasError] is true.
  final Widget? assistiveText;

  /// [Widget] that will be displayed alongside [assistiveText] when [hasError]
  /// is true.
  final Widget? errorIcon;

  /// [UIKitSizeScheme] determining the value of different attributes of this
  /// radio button group.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme] determining the value of different color
  /// attributes of this radio button group.
  final UIKitColorScheme? colorScheme;

  /// [UIKitShadowScheme] determining the value of different shadow
  /// attributes of this radio button group.
  final UIKitShadowScheme? shadowScheme;

  /// [List] containing [Widget] that will be used as labels for the
  /// different radio buttons of this group.
  final List<Widget>? optionLabels;

  /// [bool] indicating the layout of this radio button group.
  final bool? isVertical;

  /// [bool] indicating whether this widget is in error state
  final bool? hasError;

  /// [Function]
  /// Set it to (index) => setState(() => _selectedRadioItem = index)
  /// in order to get the index of the selected radio item that you need
  /// in your logic. If null, widget is disabled.
  final void Function(int?)? onTap;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(onTap == null
        ? UIKitState.disabled
        : hasError ?? false
            ? UIKitState.error
            : UIKitState.defaultState);
    final selectedIndex$ = useState<int?>(initialSelectedIndex);
    final themeData$ = useState(UIKitTheme.of(context).radioGroupThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    // ignore: unused_local_variable
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));
    final size$ = useState(findSize(themeData$.value));

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          DefaultTextStyle(
            style: size$.value.labelStyle
                    ?.copyWith(color: colorHelper.backgroundColor) ??
                TextStyle(color: colorHelper.backgroundColor),
            child: label!,
          ),
          SizedBox(height: size$.value.spacing),
        ],
        DefaultTextStyle(
          style: size$.value.inputStyle
                  ?.copyWith(color: colorHelper.contentColor) ??
              TextStyle(color: colorHelper.contentColor),
          child: Wrap(
            spacing: size$.value.secondarySpacing ?? 16,
            runSpacing: size$.value.height ?? 12,
            children: [
              for (Widget element in optionLabels ?? []) ...[
                Row(
                  mainAxisSize:
                      isVertical ?? false ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    UIKitRadioButton(
                      isSelected: selectedIndex$.value ==
                          optionLabels?.indexOf(element),
                      onTap: onTap == null
                          ? null
                          : () {
                              selectedIndex$.value =
                                  optionLabels?.indexOf(element);
                              onTap?.call(selectedIndex$.value);
                            },
                    ),
                    SizedBox(width: size$.value.width),
                    element,
                  ],
                ),
              ],
            ],
          ),
        ),
        if (assistiveText != null) ...[
          SizedBox(height: size$.value.spacing),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: size$.value.assistiveStyle
                        ?.copyWith(color: colorHelper.secondaryContentColor) ??
                    TextStyle(color: colorHelper.secondaryContentColor),
                child: assistiveText!,
              ),
              SizedBox(width: size$.value.spacing),
              if (errorIcon != null && state$.value == UIKitState.error)
                UIKitIconTheme(
                  color: colorHelper.secondaryContentColor,
                  size: size$.value.iconSize,
                  child: errorIcon!,
                ),
            ],
          )
        ],
      ],
    );
  }

  UIKitSizeScheme findSize(UIKitRadioGroupThemeData themeData) {
    UIKitSizeScheme sizeScheme;
    if (this.sizeScheme != null) {
      sizeScheme = this.sizeScheme!;
    } else {
      switch (size) {
        case UIKitSizes.small:
          sizeScheme = themeData.smallSize;
          break;
        case UIKitSizes.large:
          sizeScheme = themeData.largeSize;
          break;
        default:
          sizeScheme = themeData.mediumSize;
          break;
      }
    }

    return sizeScheme;
  }
}
