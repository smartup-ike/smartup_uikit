import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'uikit_button.dart';
import 'uikit_dropdown_button.dart';
import 'uikit_dropdown_route.dart';
import 'uikit_dropdown_menu.dart';

const monthsMap = {
  0: 'Ιανουάριος',
  1: 'Φεβρουάριος',
  2: 'Μάρτιος',
  3: 'Απρίλιος',
  4: 'Μάιος',
  5: 'Ιούνιος',
  6: 'Ιούλιος',
  7: 'Αύγουστος',
  8: 'Σεπτέμβριος',
  9: 'Οκτώβριος',
  10: 'Νοέμβριος',
  11: 'Δεκέμβριος',
};
const daysList = [
  'Δ',
  'Τ',
  'Τ',
  'Π',
  'Π',
  'Σ',
  'Κ',
];

class UIKitDatePicker extends HookWidget {
  const UIKitDatePicker({
    super.key,
    this.actions = const [],
  });

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final year$ = useState<int?>(DateTime.now().year);
    final month$ = useState<int?>(DateTime.now().month);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: const [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: MonthSelector(
                    onChanged: (value) => month$.value = value! + 1,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: YearSelector(
                    onChanged: (value) => year$.value = value! + 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DataTable(
                  columnSpacing: 4,
                  columns: List.generate(
                    7,
                    (index) => DataColumn(label: Text(daysList[index])),
                  ),
                  rows: List.generate(
                    6,
                    (rowIndex) {
                      return DataRow(
                        cells: List.generate(
                          7,
                          (columnIndex) {
                            final date = findDate(
                              DateTime(
                                year$.value!,
                                month$.value!,
                                (rowIndex * 7) + (columnIndex + 1),
                              ),
                              columnIndex + 1,
                            );
                            return DataCell(
                              Text(
                                date.day.toString(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: actions!,
          ),
        ],
      ),
    );
  }

  DateTime findDate(DateTime date, int weekday) {
    if (date.weekday == weekday) {
      return date;
    }
    return findDate(date.subtract(const Duration(days: 1)), weekday);
  }
}

class MonthSelector extends StatefulWidget {
  const MonthSelector({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<int?> onChanged;

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late List<int?> selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = [DateTime.now().month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton.smallFilled(
      childSize: const Size(150, 90),
      input: Text(monthsMap[selectedValue.first] ?? ''),
      isDisabled: false,
      trailing: const Icon(Icons.arrow_downward_sharp),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<int?>>(
              UIKitDropdownRoute(
                child: MonthDialog(initialValue: selectedValue),
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
  const MonthDialog({super.key, this.initialValue = const []});
  final List<int?> initialValue;

  @override
  State<MonthDialog> createState() => _MonthDialogState();
}

class _MonthDialogState extends State<MonthDialog> {
  late List<int?> value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownMenu(
      value: value,
      onChange: (value) => setState(() => this.value = value),
      multiselect: false,
      itemTrailing: const Icon(Icons.check),
      actions: [
        UIKitButton.smallPrimary(
          labelText: const Text('Εντάξει'),
          onTap: () => Navigator.of(context).pop(value),
        ),
      ],
      options: List.generate(12, (index) => index),
      labels: List.generate(12, (index) => Text(monthsMap[index] ?? '')),
    );
  }
}

class YearSelector extends StatefulWidget {
  const YearSelector({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<int?> onChanged;

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  late List<int?> selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = [DateTime.now().year];
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton.smallFilled(
      childSize: const Size(90, 90),
      input: Text(selectedValue.first.toString()),
      isDisabled: false,
      trailing: const Icon(Icons.arrow_downward_sharp),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<int?>>(
              UIKitDropdownRoute(
                child: YearDialog(initialValue: selectedValue),
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

class YearDialog extends StatefulWidget {
  const YearDialog({super.key, this.initialValue = const []});
  final List<int?> initialValue;

  @override
  State<YearDialog> createState() => _YearDialogState();
}

class _YearDialogState extends State<YearDialog> {
  late List<int?> value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    const firstYear = 1980;
    const lastYear = 2100;
    const difference = lastYear - firstYear;
    return UIKitDropdownMenu(
      value: value,
      onChange: (value) => setState(() => this.value = value),
      multiselect: false,
      itemTrailing: const Icon(Icons.check),
      actions: [
        UIKitButton.smallPrimary(
          labelText: const Text('Εντάξει'),
          onTap: () => Navigator.of(context).pop(value),
        ),
      ],
      options: List.generate(difference, (index) => firstYear + index),
      labels: List.generate(
        difference,
        (index) => Text((firstYear + index).toString()),
      ),
    );
  }
}
