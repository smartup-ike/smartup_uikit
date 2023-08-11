import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/uikit_dropdown_menu_item.dart';

import '../smartup_uikit.dart';
import 'helpers/uikit_helper_functions.dart';

class UIKitDropdownMenuMultiSelect<T> extends UIKitDropdownMenu {
  final List<T> value;
  final List<T>? initialValue;
  final ValueChanged<List<T?>> onChange;

  const UIKitDropdownMenuMultiSelect({
    super.key,
    required this.value,
    this.initialValue,
    required this.onChange,
    List<T> options = const [],
    List<Widget> labels = const [],
    List<Widget> actions = const <Widget>[],
    Widget? itemTrailing,
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
    bool? hasSearchBar,
    void Function(String)? searchOnChange,
  }) : super(
          options: options,
          multiselect: true,
          shadowScheme: shadowScheme,
          searchOnChange: searchOnChange,
          itemTrailing: itemTrailing,
          hasSearchBar: hasSearchBar,
          colorScheme: colorScheme,
          sizeScheme: sizeScheme,
          actions: actions,
          labels: labels,
        );

  @override
  Widget build(BuildContext context) {
    final currentValue$ = useState<List<T>>(initialValue ?? <T>[]);
    final searchController = useTextEditingController();
    final themeData$ = useState(UIKitTheme.of(context).dropdownMenuThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));
    final pleaseRebuild$ = useState(false);

    return Material(
      child: Container(
        padding: size$.value.padding,
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(
                  shrinkWrap: options.length < 20,
                  padding: size$.value.padding,
                  children: [
                    (hasSearchBar != null && hasSearchBar == true)
                        ? const SizedBox(height: 30)
                        : const SizedBox(),
                    for (int i = 0; i < options.length; i++) ...[
                      UIKitDropdownMenuItem<T>(
                        label: labels[i],
                        value: options[i],
                        onTap: () {
                          currentValue$.value.contains(options[i])
                              ? currentValue$.value.remove(options[i])
                              : currentValue$.value.add(options[i]);
                          onChange.call(currentValue$.value);
                          pleaseRebuild$.value = !pleaseRebuild$.value;
                        },
                        multiselect: true,
                        isSelected: currentValue$.value.contains(options[i]),
                        trailing: null,
                      ),
                      const SizedBox(height: 4),
                    ],
                    actions.isNotEmpty
                        ? const SizedBox(height: 45)
                        : const SizedBox(),
                  ],
                ),
                if (hasSearchBar == true)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: UIKitTextInput.mediumLineSearch(
                      onChanged: searchOnChange,
                      controller: searchController,
                    ),
                  ),
              ],
            ),
            actions.isNotEmpty
                ? SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(size$.value.borderRadius ?? 0),
                      child: ColoredBox(
                        color: colors$.value.defaultBackgroundColor ??
                            Colors.white,
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
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
