import 'package:flutter/material.dart';
import '../uikit_button.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu.dart';
import '../uikit_dropdown_route.dart';

class UIKitYearSelector extends StatefulWidget {
  const UIKitYearSelector(
      {super.key, required this.onChanged, this.trailing, this.itemTrailing});
  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;

  @override
  State<UIKitYearSelector> createState() => _UIKitYearSelectorState();
}

class _UIKitYearSelectorState extends State<UIKitYearSelector> {
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
      trailing: widget.trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue = await Navigator.of(context).push<List<int?>>(
              UIKitDropdownRoute(
                child: YearDialog(
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

class YearDialog extends StatefulWidget {
  const YearDialog({
    super.key,
    this.initialValue = const [],
    this.itemTrailing,
  });

  final List<int?> initialValue;
  final Widget? itemTrailing;

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
      itemTrailing: widget.itemTrailing,
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
