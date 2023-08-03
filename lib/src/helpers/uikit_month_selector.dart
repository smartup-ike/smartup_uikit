import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';


class UIKitMonthSelector extends HookWidget {
  const UIKitMonthSelector({
    super.key,
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
    this.dateMustBeAfter,
    required this.monthsMap,
    this.initialValue,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeAfter;
  final Map<int, String> monthsMap;
  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    // If the user specified a limit then we make the calendar start at the month at the beginning of the limit.
    // Otherwise the calendar will start at the current month.
    int? selectedValue$ = dateMustBeAfter != null
        ? dateMustBeAfter!.month
        : initialValue;

    return UIKitDropdownButton.largeFilled(
      input: Text(monthsMap[selectedValue$] ?? ''),
      isDisabled: false,
      trailing: trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue$ = await Navigator.of(context).push<int?>(
              UIKitDropdownRoute(
                child: MonthDialog(
                  initialValue: selectedValue$,
                  itemTrailing: itemTrailing,
                  monthsMap: monthsMap,
                ),
                position: position,
                size: size,
              ),
            ) ??
            selectedValue$;
        onChanged.call(selectedValue$);
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
    final ValueNotifier<int?> selectedValue$ = useState(initialValue);
    final values$ = useState(monthsMap.keys.toList());
    final labels$ = useState(
      List.generate(
        monthsMap.length,
        (month) => Text(monthsMap.values.toList()[month]),
      ),
    );

    return UIKitDropdownMenuSingleSelect(
      value: selectedValue$.value,
      onChange: (value) => selectedValue$.value = value,
      itemTrailing: itemTrailing,
      options: values$.value,
      labels: labels$.value,
      hasSearchBar: false,
      //sizeScheme: UIKitSizeScheme(height: 400),
    );
  }
}