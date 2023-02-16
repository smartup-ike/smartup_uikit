import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_helper_functions.dart';
import 'package:smartup_uikit/src/theme/uikit_theme.dart';
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
        useState<List<T?>>(List.from(initialValue ?? [], growable: true));

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
    final themeData$ = useState(UIKitTheme.of(context).menuItemThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));

    Color? backgroundColor;
    Color? borderColor;
    Color? contentColor;
    Color? secondaryContentColor;
    List<BoxShadow>? shadows;

    if (isHovered$.value) {
      backgroundColor = colors$.value.hoverBackgroundColor;
      borderColor = colors$.value.hoverBorderColor;
      contentColor = colors$.value.hoverContentColor;
      secondaryContentColor = colors$.value.hoverSecondaryContentColor;
      shadows = shadows$.value.hoverShadow;
    } else {
      backgroundColor = colors$.value.defaultBackgroundColor;
      borderColor = colors$.value.defaultBorderColor;
      contentColor = colors$.value.defaultContentColor;
      secondaryContentColor = isSelected
          ? colors$.value.activeSecondaryContentColor
          : colors$.value.defaultSecondaryContentColor;
      shadows = shadows$.value.defaultShadow;
    }

    return MouseRegion(
      onHover: (_) => isHovered$.value = true,
      onExit: (_) => isHovered$.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 0,
            ),
            boxShadow: shadows,
          ),
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
                  ),
                ),
                SizedBox(width: size$.value.spacing),
              ],
              DefaultTextStyle(
                style: size$.value.labelStyle?.copyWith(color: contentColor) ??
                    const TextStyle(),
                child: label ?? const Text(''),
              ),
              if (trailing != null) ...[
                const Spacer(),
                UIKitIconTheme(
                  size: size$.value.trailingSize,
                  color: secondaryContentColor,
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
