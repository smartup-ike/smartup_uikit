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

class UIKitMonthSelector extends StatefulWidget {
  const UIKitMonthSelector({
    super.key,
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;

  @override
  State<UIKitMonthSelector> createState() => _UIKitMonthSelectorState();
}

class _UIKitMonthSelectorState extends State<UIKitMonthSelector> {
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
      itemTrailing: widget.itemTrailing,
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
