import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          label!,
          const SizedBox(height: 8),
        ],
        Wrap(
          spacing: 26,
          runSpacing: 12,
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
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(width: 6),
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
}
