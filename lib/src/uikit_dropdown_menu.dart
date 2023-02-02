import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'uikit_icon_theme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'uikit_checkbox.dart';

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
    this.value,
    required this.onChange,
    this.children = const [],
    this.actions = const [],
    required this.multiselect,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.width,
    required this.height,
  });

  final T? value;
  final ValueChanged<T?> onChange;
  final List<UIKitDropdownMenuItem<T>> children;
  final List<Widget> actions;
  final bool multiselect;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(sizeScheme?.borderRadius ?? 8),
          ),
          child: ListView.builder(
            padding: sizeScheme?.padding,
            itemBuilder: (context, index) {
              return children[index];
            },
            itemCount: children.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions,
          ),
        ),
      ],
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
    required this.selectable,
    required this.isSelected,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : assert(
          selectable ^ (trailing != null),
          'Either \'selectable\' is true and the widget has a checkbox or it has a trailing widget, not both.',
        );

  final T value;
  final VoidCallback onTap;
  final Widget? label;
  final Widget? trailing;
  final List<UIKitDropdownMenuItem<T>>? children;
  final bool selectable;
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
          color: colorScheme?.defaultBackgroundColor ?? Colors.transparent,
          child: Row(
            children: [
              if (selectable) ...[
                UIKitCheckbox(
                  isChecked: isSelected,
                  icon: const Icon(
                    Icons.check,
                    size: 12,
                  ),
                  colorScheme: colorScheme,
                  sizeScheme: sizeScheme,
                ),
                const SizedBox(width: 8),
              ],
              DefaultTextStyle(
                style: sizeScheme?.labelTextStyle ?? const TextStyle(),
                child: label ?? const SizedBox(),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                UIKitIconTheme(
                  size: sizeScheme?.iconSize,
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
