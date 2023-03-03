import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'uikit_dropdown_menu_item.dart';

class UIKitDropdownMenu<T> extends HookWidget {
  const UIKitDropdownMenu({
    super.key,
    required this.value,
    this.initialValue,
    required this.onChange,
    this.options = const [],
    this.labels = const [],
    this.actions = const [],
    required this.multiselect,
    this.itemTrailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.width,
    this.height,
  }) : assert(
          options.length == labels.length,
          'There must be exactly one label for each option!',
        );

  final List<T?> value;
  final List<T?>? initialValue;
  final ValueChanged<List<T?>> onChange;
  final List<T> options;
  final List<Widget> labels;
  final List<Widget> actions;
  final bool multiselect;
  final Widget? itemTrailing;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final currentValue$ =
        useState<List<T?>>(List.from(initialValue ?? <T?>[], growable: true));

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(sizeScheme?.borderRadius ?? 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            padding: sizeScheme?.padding,
            child: Column(
              children: [
                for (int i = 0; i < options.length; i++) ...[
                  UIKitDropdownMenuItem<T>(
                    label: labels[i],
                    value: options[i],
                    onTap: multiselect
                        ? () {
                            currentValue$.value.contains(options[i])
                                ? currentValue$.value.remove(options[i])
                                : currentValue$.value.add(options[i]);
                            onChange.call(currentValue$.value);
                          }
                        : () {
                            currentValue$.value.isEmpty
                                ? currentValue$.value.add(options[i])
                                : currentValue$.value.first = options[i];
                            onChange.call(currentValue$.value);
                          },
                    multiselect: multiselect,
                    isSelected: currentValue$.value.contains(options[i]),
                    trailing: multiselect ? null : itemTrailing,
                  ),
                ]
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ),
        ],
      ),
    );
  }
}
