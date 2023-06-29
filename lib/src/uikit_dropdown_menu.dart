import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/uikit_text_input.dart';
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
    this.hasSearchBar,
    this.controller,
    this.searchOnChange,
  })  : assert(
          options.length == labels.length,
          'There must be exactly one label for each option!',
        ),
        assert(
          !((hasSearchBar ?? false) ^ (searchOnChange != null)),
          'Doesn\'t have searchBar or onChange method, must have both',
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
  final bool? hasSearchBar;
  final TextEditingController? controller;
  final void Function(String)? searchOnChange;

  @override
  Widget build(BuildContext context) {
    final currentValue$ =
        useState<List<T?>>(List.from(initialValue ?? <T?>[], growable: true));
    final searchController = controller ?? useTextEditingController();
    final themeData$ = useState(UIKitTheme.of(context).dropdownMenuThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size$.value.width,
          height: size$.value.height,
          decoration: BoxDecoration(
            color: colors$.value.defaultBackgroundColor,
            border: Border.all(
              color: colors$.value.defaultBorderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 1,
            ),
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            boxShadow: shadows$.value.defaultShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hasSearchBar == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UIKitTextInput.mediumLineSearch(
                    onChanged: searchOnChange,
                    controller: searchController,
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  padding: size$.value.padding,
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
                        const SizedBox(height: 4),
                      ],
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(size$.value.borderRadius ?? 0),
                child: ColoredBox(
                  color: colors$.value.defaultBackgroundColor ?? Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
