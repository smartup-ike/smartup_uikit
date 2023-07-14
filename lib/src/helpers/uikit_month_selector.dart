import 'package:flutter/material.dart';
import '../uikit_button.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu.dart';
import '../uikit_dropdown_route.dart';

const monthsMap = {
  1: 'Ιανουάριος',
  2: 'Φεβρουάριος',
  3: 'Μάρτιος',
  4: 'Απρίλιος',
  5: 'Μάιος',
  6: 'Ιούνιος',
  7: 'Ιούλιος',
  8: 'Αύγουστος',
  9: 'Σεπτέμβριος',
  10: 'Οκτώβριος',
  11: 'Νοέμβριος',
  12: 'Δεκέμβριος',
};

class UIKitMonthSelector extends StatefulWidget {
  const UIKitMonthSelector({
    super.key,
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
    this.dateMustBeAfter,
    this.dateMustBeBefore,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;
  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeAfter;
  final DateTime? dateMustBeBefore;

  @override
  State<UIKitMonthSelector> createState() => _UIKitMonthSelectorState();
}

class _UIKitMonthSelectorState extends State<UIKitMonthSelector> {
  late List<int?> selectedValue;

  @override
  void initState() {
    super.initState();

    // If the user specified a limit then we make the calendar start at the month at the beginning of the limit.
    // Otherwise the calendar will start at the current month.
    if(widget.dateMustBeAfter!=null)
      {
        selectedValue = [widget.dateMustBeAfter!.month];
      }
    else
      {
        selectedValue = [DateTime.now().month];
      }
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton.smallFilled(
      input: Text(monthsMap[selectedValue.first] ?? ''),
      isDisabled: false,
      trailing: widget.trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<int?>>(
              UIKitDropdownRoute(
                child: MonthDialog(
                  initialValue: selectedValue,
                  itemTrailing: widget.itemTrailing,
                ),
                position: position,
                size: size,
              ),
            ) ??
            selectedValue;
        setState(() {});
        widget.onChanged.call(selectedValue.first);
        return;
      },
    );
  }
}

class MonthDialog extends StatefulWidget {
  const MonthDialog({
    super.key,
    this.initialValue = const [],
    this.itemTrailing,
  });

  final List<int?> initialValue;
  final Widget? itemTrailing;

  @override
  State<MonthDialog> createState() => _MonthDialogState();
}

class _MonthDialogState extends State<MonthDialog> {
  late List<int?> value;
  final List<int?> values = List.generate(12, (index) => index + 1);
  final List<Widget> labels =
      List.generate(12, (index) => Text(monthsMap[index + 1] ?? ''));
  List<int?> toShowValues = [];
  List<Widget> toShowLabels = [];
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    toShowLabels = labels;
    toShowValues = values;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownMenu(
      value: value,
      hasSearchBar: true,
      searchOnChange: (value) {
        List<Widget> tempLabels = [];
        List<int?> tempValues = [];
        if ((value ?? '').isEmpty) {
          setState(
            () {
              toShowValues = values;
              toShowLabels = labels;
            },
          );
        } else {
          monthsMap.forEach((key, mapValue) {
            if (mapValue.contains(value)) {
              tempValues.add(key);
              tempLabels.add(Text(mapValue));
            }
          });
          setState(() {
            toShowValues = tempValues;
            toShowLabels = tempLabels;
          });
        }
      },
      onChange: (value) => setState(() => this.value = value),
      multiselect: false,
      itemTrailing: widget.itemTrailing,
      actions: [
        UIKitButton.smallPrimary(
          labelText: const Text('Εντάξει'),
          onTap: () => Navigator.of(context).pop(value),
        ),
      ],
      options: toShowValues,
      labels: toShowLabels,
    );
  }
}