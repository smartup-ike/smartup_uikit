import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class LeaveTypeSelector extends StatefulWidget {
  const LeaveTypeSelector({super.key});

  @override
  State<LeaveTypeSelector> createState() => _LeaveTypeSelectorState();
}

class _LeaveTypeSelectorState extends State<LeaveTypeSelector> {
  bool _selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return UIKitButton.primary(
      labelText: Text('Open to select, selected:$_selectedValue'),
      onTap: () async {
        final value = await Navigator.of(context).push<bool?>(DialogRoute(
          context: context,
          builder: (context) {
            return const SelectionDialog();
          },
        ));
        if (value != null) {
          setState(() {
            _selectedValue = value;
          });
        }
      },
    );
  }
}

class SelectionDialog extends StatefulWidget {
  const SelectionDialog({super.key, this.initialValue = false});
  final bool initialValue;

  @override
  State<SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        width: 500,
        child: ListView(
          children: [
            UIKitDropdownMenuItem(
              value: true,
              label: Text('Adeia'),
              onTap: () {
                setState(() {
                  _value = true;
                });
              },
              selectable: true,
              isSelected: _value,
            ),
            UIKitDropdownMenuItem(
              value: false,
              label: Text('Astheneia'),
              onTap: () {
                setState(() {
                  _value = false;
                });
              },
              selectable: true,
              isSelected: !_value,
            ),
            Row(
              children: [
                UIKitButton.primary(
                  labelText: const Text('OK'),
                  onTap: () {
                    Navigator.of(context).pop(_value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
