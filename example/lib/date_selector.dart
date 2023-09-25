import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({this.dateMustBeFrom, this.dateMustBeUntil, super.key, required this.onChanged,});

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeFrom;
  final DateTime? dateMustBeUntil;
  final ValueChanged<List<DateTime?>> onChanged;

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
      label: const Text('Επιλεγμένες Ημερομηνίες'),
      input: Text(selectedValue.map((e) => e?.toLocal().toString().substring(0, 10)).join(', ')),
      isDisabled: false,
      trailing: const UIKitIcon.asset('assets/images/url.svg'),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<DateTime?>>(
              DialogRoute(
                builder: (context) => Dialog(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
                    child: DatePickerDialog(
                      dateMustBeUntil: widget.dateMustBeUntil,
                      dateMustBeFrom: widget.dateMustBeFrom,
                      initialValue: selectedValue,
                    ),
                  ),
                ), context: context,
              ),
            ) ??
            [];
        widget.onChanged.call(selectedValue);
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
    this.dateMustBeFrom,
    this.dateMustBeUntil,
  });

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeFrom;
  final DateTime? dateMustBeUntil;
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
      dateMustBeFrom: widget.dateMustBeFrom,
      dateMustBeUntil: widget.dateMustBeUntil,
      dropdownButtonTrailing: const UIKitIcon.asset('assets/images/url.svg'),
      dropdownMenuItemTrailing: const UIKitIcon.asset('assets/images/url.svg'),
    );
  }
}