import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'uikit_checkbox.dart';

class UIKitDropdown extends HookWidget {
  const UIKitDropdown({
    super.key,
    this.label,
    this.optionLabels,
    this.checkboxIcon,
    this.isExpanded,
    this.isDisabled,
    this.multiselect,
    this.sizeScheme,
    this.colorScheme,
    required this.getSelected,
    required this.expand,
  });

  final Widget? label;
  final List<Widget>? optionLabels;
  final Widget? checkboxIcon;
  final bool? isExpanded;
  final bool? isDisabled;
  final bool? multiselect;
  final UIKitSizeScheme? sizeScheme;
  final UIKitColorScheme? colorScheme;
  final void Function(Set<int?>?) getSelected;
  final ValueChanged<bool> expand;

  @override
  Widget build(BuildContext context) {
    final selectedIndexes$ = useState<Set<int?>?>({});
    final state$ = useState<UIKitState>(
        isDisabled ?? true ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: state$.value == UIKitState.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          onHover: (_) {
            if (isDisabled ?? true) {
              state$.value = UIKitState.hover;
              isHovered$.value = true;
            }
          },
          onExit: (_) {
            if (isDisabled ?? true) {
              state$.value = UIKitState.defaultState;
              isHovered$.value = false;
            }
          },
          child: Row(
            children: [
              const SizedBox(width: 10),
              if (multiselect ?? false)
                UIKitCheckbox(
                  icon: checkboxIcon,
                  colorScheme: colorScheme,
                  sizeScheme: sizeScheme,
                  isChecked:
                      selectedIndexes$.value?.length == optionLabels?.length,
                  onChanged: (value) {
                    value ?? false
                        ? selectedIndexes$.value?.addAll(List.generate(
                            optionLabels?.length ?? 0, (index) => index))
                        : selectedIndexes$.value
                            ?.removeWhere((element) => true);
                    getSelected.call(selectedIndexes$.value);
                  },
                ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => expand.call(!(isExpanded ?? false)),
                icon: Icon(
                  isExpanded ?? false
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              label!,
            ],
          ),
        ),
        if (isExpanded ?? false)
          for (Widget element in optionLabels ?? []) ...[
            ..._buildElement(element, selectedIndexes$.value),
            if (element.runtimeType != UIKitDropdown)
              const SizedBox(height: 18),
          ],
      ],
    );
  }

  List<Widget> _buildElement(Widget element, Set<int?>? selectedIndexes) {
    List<Widget> list = [];
    if (element.runtimeType == UIKitDropdown) {
      list.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: element,
            ),
          ],
        ),
      );
    } else {
      list.add(
        MouseRegion(
          child: Row(
            children: [
              const SizedBox(width: 10),
              if (multiselect ?? false)
                UIKitCheckbox(
                  icon: checkboxIcon,
                  colorScheme: colorScheme,
                  sizeScheme: sizeScheme,
                  isChecked: selectedIndexes?.contains(
                    optionLabels?.indexOf(element),
                  ),
                  onChanged: (value) {
                    value ?? false
                        ? selectedIndexes?.add(
                            optionLabels?.indexOf(element),
                          )
                        : selectedIndexes?.remove(
                            optionLabels?.indexOf(element),
                          );
                    getSelected.call(selectedIndexes);
                  },
                ),
              const SizedBox(width: 10),
              element,
            ],
          ),
        ),
      );
    }
    return list;
  }
}
