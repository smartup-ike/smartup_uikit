import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'uikit_checkbox.dart';
import 'uikit_icon_theme.dart';

/// ```dart
///   Dropdown(
///     child: Text(),
///     builder: (context) => UIKitDropdown(...),
///   )
/// ```

/// ```dart
/// UIKitDropdown(
///   value: '',
///   onChange: (List<String> newValue) {
///
///   }
///   children: [
///     DropdownOption<String>(
///       value: 'option_1',
///       label: Text('kati'),
///       trailing: FlutterLogo(),
///       selectable: false,
///       disabled: false,
///       children: [
///         DropdownOption(
///           value: 'value_1_1',
///         ),
///       ],
///     ),
///     DropdownOption(
///       label: Text('kati allo'),
///     ),
///   ],
/// ),
/// ```

class UIKitDropdownMenu<T> extends HookWidget {
  const UIKitDropdownMenu({
    super.key,
    required this.value,
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
    final currentValue$ = useState<List<T?>>(
      multiselect ? List.from(value, growable: true) : [],
    );

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
                    colorScheme: UIKitColorScheme(
                      defaultBackgroundColor: Colors.red,
                      hoverBackgroundColor: Colors.blue,
                      focusedBackgroundColor: Colors.purple,
                      activeBackgroundColor: Colors.teal,
                      disabledBackgroundColor: Colors.grey,
                      defaultContentColor: Colors.white,
                      hoverContentColor: Colors.green,
                      focusedContentColor: Colors.red,
                      activeContentColor: Colors.orange,
                      disabledContentColor: Colors.grey,
                      defaultBorderColor: Colors.black,
                      hoverBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      activeBorderColor: Colors.black,
                      disabledBorderColor: Colors.black,
                    ),
                    sizeScheme: UIKitSizeScheme(
                      width: 16,
                      height: 16,
                      leadingSize: 12,
                    ),
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

class UIKitDropdownMenuItem<T> extends HookWidget {
  const UIKitDropdownMenuItem({
    super.key,
    required this.value,
    required this.onTap,
    this.label,
    this.trailing,
    this.children,
    required this.multiselect,
    required this.isSelected,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : assert(
          multiselect ^ (trailing != null),
          'Either \'selectable\' is true and the widget has a checkbox or it has a trailing widget, not both.',
        );

  final T value;
  final VoidCallback onTap;
  final Widget? label;
  final Widget? trailing;
  final List<UIKitDropdownMenuItem<T>>? children;
  final bool multiselect;
  final bool isSelected;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final isHovered$ = useState(false);
    return MouseRegion(
      onHover: (_) => isHovered$.value = true,
      onExit: (_) => isHovered$.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: isHovered$.value
              ? colorScheme?.hoverBackgroundColor ?? Colors.transparent
              : isSelected
                  ? colorScheme?.activeBackgroundColor ?? Colors.transparent
                  : colorScheme?.defaultBackgroundColor ?? Colors.transparent,
          child: Row(
            children: [
              if (multiselect) ...[
                IgnorePointer(
                  child: UIKitCheckbox(
                    isChecked: isSelected,
                    icon: const Icon(
                      Icons.check,
                      size: 12,
                    ),
                    colorScheme: colorScheme,
                    sizeScheme: sizeScheme,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              DefaultTextStyle(
                style: sizeScheme?.labelStyle ?? const TextStyle(),
                child: label ?? const SizedBox(),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                UIKitIconTheme(
                  size: sizeScheme?.leadingSize,
                  color: isSelected
                      ? colorScheme?.defaultContentColor
                      : colorScheme?.disabledContentColor,
                  child: trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
