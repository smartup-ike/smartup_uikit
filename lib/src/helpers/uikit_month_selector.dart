import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu.dart';
import '../uikit_dropdown_route.dart';

class UIKitMonthSelector extends HookWidget {
  const UIKitMonthSelector({
    super.key,
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
    this.dateMustBeAfter,
    required this.monthsMap,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeAfter;
  final Map<int, String> monthsMap;

  @override
  Widget build(BuildContext context) {
    // If the user specified a limit then we make the calendar start at the month at the beginning of the limit.
    // Otherwise the calendar will start at the current month.
    final ValueNotifier<int?> selectedValue$ = useState(dateMustBeAfter != null
        ? dateMustBeAfter!.month
        : DateTime.now().month);

    return UIKitDropdownButton.largeFilled(
      input: Text(monthsMap[selectedValue$.value] ?? ''),
      isDisabled: false,
      trailing: trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue$.value = await Navigator.of(context).push<int?>(
              UIKitDropdownRoute(
                child: MonthDialog(
                  initialValue: selectedValue$.value,
                  itemTrailing: itemTrailing,
                  monthsMap: monthsMap,
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

class MonthDialog extends HookWidget {
  const MonthDialog({
    super.key,
    this.initialValue,
    this.itemTrailing,
    required this.monthsMap,
  });

  final int? initialValue;
  final Widget? itemTrailing;
  final Map<int, String> monthsMap;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<int?>> selectedValue$ = useState([initialValue]);
    final values$ = useState(monthsMap.keys.toList());
    final labels$ = useState(
      List.generate(
        monthsMap.length,
        (month) => Text(monthsMap.values.toList()[month]),
      ),
    );

    return UIKitDropdownMenu(
      value: selectedValue$.value,
      onChange: (value) => selectedValue$.value = value,
      multiselect: false,
      itemTrailing: itemTrailing,
      options: values$.value,
      labels: labels$.value,
      hasSearchBar: false,
      //sizeScheme: UIKitSizeScheme(height: 400),
    );
  }
}