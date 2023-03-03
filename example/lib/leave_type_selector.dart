import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class LeaveTypeSelector extends StatefulWidget {
  const LeaveTypeSelector({super.key});

  @override
  State<LeaveTypeSelector> createState() => _LeaveTypeSelectorState();
}

class _LeaveTypeSelectorState extends State<LeaveTypeSelector> {
  late List<String?> _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = [];
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownButton<String?>(
      label: Text(_selectedValue.join(', ')),
      isDisabled: false,
      trailing: const Icon(Icons.report_gmailerrorred),
      child: SelectionDialog(
        initialValue: _selectedValue,
      ),
      onTap: (position, size) async {
        _selectedValue = await Navigator.of(context).push<List<String?>>(
              UIKitDropdownRoute(
                child: SelectionDialog(initialValue: _selectedValue),
                position: position,
                size: size,
              ),
            ) ??
            _selectedValue;
        setState(() {});
        return;
      },
    );
  }
}

class SelectionDialog extends StatefulWidget {
  const SelectionDialog({super.key, this.initialValue = const []});
  final List<String?> initialValue;

  @override
  State<SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  late List<String?> _value;

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
      initialValue: widget.initialValue,
      multiselect: true,
      itemTrailing: const UIKitIcon.asset('assets/images/url.svg'),
      actions: [
        UIKitButton.smallGhost(
          labelText: const Text('Cancel'),
          onTap: () => Navigator.of(context).pop(widget.initialValue),
        ),
        const SizedBox(width: 8),
        UIKitButton.smallGhost(
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
