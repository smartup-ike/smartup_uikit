import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/uikit_dropdown_menu_item.dart';

import '../smartup_uikit.dart';
import 'helpers/uikit_helper_functions.dart';

class UIKitDropdownMenuSingleSelect<T> extends UIKitDropdownMenu {
  final T? initialValue;

  const UIKitDropdownMenuSingleSelect({
    super.key,
    this.initialValue,
    List<T> super.options,
    super.labels,
    super.actions,
    super.itemTrailing,
    super.trailingOnTap,
    super.colorScheme,
    super.sizeScheme,
    super.shadowScheme,
    super.hasSearchBar,
    super.searchOnChange,
  }) : super(
          multiselect: false,
        );

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final themeData = UIKitTheme.of(context).dropdownMenuThemeData;
    final colors = define(colorScheme, themeData.colorScheme);
    final size = define(sizeScheme, themeData.sizeScheme);
    final shadows = define(shadowScheme, themeData.shadowScheme);

    return Material(
      child: Container(
        padding: size.padding,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: colors.defaultBackgroundColor,
          border: Border.all(
            color: colors.defaultBorderColor ?? Colors.transparent,
            width: size.borderSize ?? 1,
          ),
          borderRadius: BorderRadius.circular(size.borderRadius ?? 8),
          boxShadow: shadows.defaultShadow,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(
                  shrinkWrap: options.length < 20,
                  padding: size.padding,
                  children: [
                    (hasSearchBar != null && hasSearchBar == true)
                        ? const SizedBox(height: 30)
                        : const SizedBox(),
                    for (int i = 0; i < options.length; i++) ...[
                      UIKitDropdownMenuItem<T>(
                        label: labels[i],
                        value: options[i],
                        onTap: () => Navigator.of(context).pop(options[i]),
                        multiselect: false,
                        isSelected: initialValue == options[i],
                        trailing: itemTrailing,
                        trailingOnTap: trailingOnTap,
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
                      leading: const Text("Αναζήτηση: "),
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
                          BorderRadius.circular(size.borderRadius ?? 0),
                      child: ColoredBox(
                        color: colors.defaultBackgroundColor ?? Colors.white,
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
