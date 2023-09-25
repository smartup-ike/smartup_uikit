import 'package:flutter/material.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu_single_select.dart';
import '../uikit_dropdown_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UIKitYearSelector extends HookWidget {
  const UIKitYearSelector({
    super.key,
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
    this.dateMustBeFrom,
    this.dateMustBeUntil,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeFrom;
  final DateTime? dateMustBeUntil;

  @override
  Widget build(BuildContext context) {
    // If the user specified a limit then we want the years to start at the beginning of the limit.
    final selectedValue$ = useState(
        dateMustBeFrom != null ? dateMustBeFrom!.year : DateTime.now().year);

    return UIKitDropdownButton.largeFilled(
      input: Text(selectedValue$.value.toString()),
      isDisabled: dateMustBeFrom?.year == dateMustBeUntil?.year,
      trailing: trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue$.value = await Navigator.of(context).push<int?>(
              UIKitDropdownRoute(
                child: YearDialog(
                  initialValue: selectedValue$.value,
                  itemTrailing: itemTrailing,
                  dateMustBeBefore: dateMustBeUntil,
                  dateMustBeAfter: dateMustBeFrom,
                ),
                position: position,
                size: size,
              ),
            ) ??
            selectedValue$.value;
        onChanged.call(selectedValue$.value);
        return;
      },
    );
  }
}

class YearDialog extends HookWidget {
  const YearDialog({
    super.key,
    this.initialValue,
    this.itemTrailing,
    // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
    this.dateMustBeAfter,
    this.dateMustBeBefore,
  });

  final int? initialValue;
  final Widget? itemTrailing;
  final DateTime? dateMustBeAfter;
  final DateTime? dateMustBeBefore;

  @override
  Widget build(BuildContext context) {
    // If the user specified a limit the we change the first and the last year to the beginning and the end of the limit.
    final firstYear$ =
        useState(dateMustBeAfter != null ? dateMustBeAfter!.year : 1980);
    final lastYear$ =
        useState(dateMustBeBefore != null ? dateMustBeBefore!.year + 1 : 2100);
    final difference$ = useState(lastYear$.value - firstYear$.value);

    final ValueNotifier<List<int>> values$ = useState(
        List.generate(difference$.value, (index) => firstYear$.value + index));
    final ValueNotifier<List<Widget>> labels$ = useState(List.generate(
        difference$.value,
        (index) => Text((firstYear$.value + index).toString())));
    final ValueNotifier<List<String>> labelsList$ = useState(List.generate(
        difference$.value, (index) => (firstYear$.value + index).toString()));
    final ValueNotifier<List<int>> toShowValues$ = useState(values$.value);
    final ValueNotifier<List<Widget>> toShowLabels$ = useState(labels$.value);

    return UIKitDropdownMenuSingleSelect(
      itemTrailing: itemTrailing,
      options: toShowValues$.value,
      labels: toShowLabels$.value,
      hasSearchBar: true,
      searchOnChange: (search) {
        if (search.isEmpty) {
          toShowValues$.value = values$.value;
          toShowLabels$.value = labels$.value;
        } else {
          int startIndex = labelsList$.value
              .indexWhere((element) => element.startsWith(search));
          int endIndex = labelsList$.value
              .lastIndexWhere((element) => element.startsWith(search));
          if (startIndex != -1) {
            toShowValues$.value = List.from(values$.value
                .sublist(startIndex, endIndex == -1 ? null : endIndex + 1));
            toShowLabels$.value = List.from(labels$.value
                .sublist(startIndex, endIndex == -1 ? null : endIndex + 1));
          }
        }
      },
    );
  }
}