import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class LeaveTypeSelector extends StatefulWidget {
  const LeaveTypeSelector({super.key});

  @override
  State<LeaveTypeSelector> createState() => _LeaveTypeSelectorState();
}

class _LeaveTypeSelectorState extends State<LeaveTypeSelector> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton<String?>(
      label: Text(_selectedValue.toString()),
      isDisabled: false,
      trailing: const Icon(Icons.report_gmailerrorred),
      child: SelectionDialog(
        initialValue: _selectedValue,
      ),
      onTap: (position) async {
        _selectedValue = await Navigator.of(context).push<String?>(
          DropdownRoute(
            child: SelectionDialog(initialValue: _selectedValue),
            position: position,
          ),
        );
        setState(() {});
        return;
      },
    );
  }
}

class SelectionDialog extends StatefulWidget {
  const SelectionDialog({super.key, this.initialValue});
  final String? initialValue;

  @override
  State<SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  late String? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownMenu<String?>(
      onChange: (value) => setState(() {
        _value = value;
      }),
      value: _value,
      multiselect: false,
      width: 300,
      height: 300,
      itemTrailing: const UIKitIcon.asset('assets/images/url.svg'),
      actions: [
        UIKitButton.ghost(
          labelText: const Text('Cancel'),
          onTap: () => Navigator.of(context).pop(widget.initialValue),
        ),
        UIKitButton.ghost(
          labelText: const Text('Ok'),
          onTap: () => Navigator.of(context).pop(_value),
        ),
      ],
      options: const [
        'one',
        'two',
        'three',
        'four',
      ],
      labels: const [
        Text('one'),
        Text('two'),
        Text('three'),
        Text('four'),
      ],
    );
  }
}
