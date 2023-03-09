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
    return UIKitDropdownButton<String?>.mediumLine(
      label: const Text('Selection'),
      input: Text(_selectedValue.join(', ')),
      isDisabled: false,
      trailing: const UIKitIcon.asset('assets/images/url.svg'),
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
        'five',
        'six',
        'seven',
        'eight',
        'nine',
        'ten',
        'eleven',
        'twelve',
        'thirteen',
        'fourteen',
        'fifteen',
        'sixteen',
        'seventeen',
        'eighteen',
        'nineteen',
        'twenty',
      ],
      labels: const [
        Text('1'),
        Text('2'),
        Text('3'),
        Text('4'),
        Text('5'),
        Text('6'),
        Text('7'),
        Text('8'),
        Text('9'),
        Text('10'),
        Text('11'),
        Text('12'),
        Text('13'),
        Text('14'),
        Text('15'),
        Text('16'),
        Text('17'),
        Text('18'),
        Text('19'),
        Text('20'),
      ],
    );
  }
}
