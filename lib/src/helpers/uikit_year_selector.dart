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
  final int firstYear = 1980;
  final int lastYear = 2100;
  int? difference;
  List<int?> toShowValues = [];
  List<Widget> toShowLabels = [];
  late List<int> values = [];
  late List<Widget> labels = [];
  late List<String> labelsList = [];
  @override
  void initState() {
    super.initState();
    int difference = lastYear - firstYear;
    values = List.generate(difference, (index) => firstYear + index);
    labels = List.generate(
        difference, (index) => Text((firstYear + index).toString()));
    labelsList =
        List.generate(difference, (index) => (firstYear + index).toString());
    toShowValues = values;
    toShowLabels = labels;

    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitDropdownMenu(
        value: value,
        onChange: (value) => setState(() => this.value = value),
        multiselect: false,
        hasSearchBar: true,
        searchOnChange: (search) {
          if ((search ?? '').isEmpty) {
            setState(
              () {
                toShowValues = values;
                toShowLabels = labels;
              },
            );
          } else {
            int startIndex =
                labelsList.indexWhere((element) => element.startsWith(search));
            int endIndex = labelsList
                .lastIndexWhere((element) => element.startsWith(search));
            if (startIndex != -1) {
              toShowValues = List.from(values.sublist(
                  startIndex, endIndex == -1 ? null : endIndex + 1));
              toShowLabels = List.from(labels.sublist(
                  startIndex, endIndex == -1 ? null : endIndex + 1));
              setState(() {});
            }
          }
        },
        itemTrailing: widget.itemTrailing,
        actions: [
          UIKitButton.smallPrimary(
            labelText: const Text('Εντάξει'),
            onTap: () => Navigator.of(context).pop(value),
          ),
        ],
        options: toShowValues,
        labels: toShowLabels);
  }
}
