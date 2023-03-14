import 'package:flutter/material.dart';
import '../uikit_button.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu.dart';
import '../uikit_dropdown_route.dart';

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
