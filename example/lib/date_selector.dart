import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late List<DateTime?> selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = [];
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton.largeLine(
      label: const Text('Selected date'),
      input: Text(selectedValue.map((e) => e?.toLocal().toString()).join(', ')),
      isDisabled: false,
      trailing: const UIKitIcon.asset('assets/images/url.svg'),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<DateTime?>>(
              UIKitDropdownRoute(
                child: DatePickerDialog(initialValue: selectedValue),
                position: position,
                size: size,
              ),
            ) ??
            selectedValue;
        setState(() {});
        return;
      },
    );
  }
}

class DatePickerDialog extends StatefulWidget {
  const DatePickerDialog({
    super.key,
    this.initialValue = const [],
  });

  final List<DateTime?> initialValue;

  @override
  State<DatePickerDialog> createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<DatePickerDialog> {
  late List<DateTime?> value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDatePicker(
      onChanged: (newValue) => value = newValue,
      dropdownButtonTrailing: const UIKitIcon.asset('assets/images/url.svg'),
      dropdownMenuItemTrailing: const UIKitIcon.asset('assets/images/url.svg'),
    );
  }
}
