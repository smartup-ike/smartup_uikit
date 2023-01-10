import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'uikit_radio_button.dart';
import 'helpers/size_scheme.dart';
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
  });

  final Widget? label;
  final Widget? assistiveText;
  final SizeScheme? sizeScheme;
  final UIKitColorScheme? colorScheme;
  final List<Widget>? optionLabels;
  final bool? isVertical;

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
