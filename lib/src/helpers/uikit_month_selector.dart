import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../uikit_button.dart';
import '../uikit_dropdown_button.dart';
import '../uikit_dropdown_menu.dart';
import '../uikit_dropdown_route.dart';

class UIKitMonthSelector extends HookWidget {
  const UIKitMonthSelector({
    required this.onChanged,
    this.trailing,
    this.itemTrailing,
    this.dateMustBeAfter,
    required this.monthsMap$,
  });

  final ValueChanged<int?> onChanged;
  final Widget? trailing;
  final Widget? itemTrailing;
  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeAfter;
  final monthsMap$;




  @override
  Widget build(BuildContext context) {

    final ValueNotifier? selectedValue$ = useState([DateTime.now().month]);



    // If the user specified a limit then we make the calendar start at the month at the beginning of the limit.
    // Otherwise the calendar will start at the current month.
    if(dateMustBeAfter!=null)
    {
      selectedValue$!.value = [dateMustBeAfter!.month];
    }
    else
    {
      selectedValue$!.value = [DateTime.now().month];
    }

    return UIKitDropdownButton.smallFilled(
      input: Text(monthsMap$.value[selectedValue$.value.first] ?? ''),
      isDisabled: false,
      trailing: trailing ?? const SizedBox(),
      onTap: (position, size) async {
        selectedValue$.value = await Navigator.of(context).push<List<int?>>(
              UIKitDropdownRoute(
                child: MonthDialog(
                  initialValue: selectedValue$.value,
                  itemTrailing: itemTrailing,
                  monthsMap: monthsMap$.value,
                ),
                position: position,
                size: size,
              ),
            ) ??
            selectedValue$.value;

        onChanged.call(selectedValue$.value.first);
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
    required this.monthsMap,
  });

  final List<int?> initialValue;
  final Widget? itemTrailing;
  final monthsMap;

  @override
  State<MonthDialog> createState() => _MonthDialogState();
}

class _MonthDialogState extends State<MonthDialog> {
  late List<int?> value;
  final List<int?> values = List.generate(12, (index) => index + 1);

  List<int?> toShowValues = [];
  List<Widget> toShowLabels = [];
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;

    toShowValues = values;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels =
    List.generate(12, (index) => Text(widget.monthsMap[index + 1] ?? ''));
    toShowLabels = labels;
    return UIKitDropdownMenu(
      value: value,
      hasSearchBar: true,
      searchOnChange: (value) {
        List<Widget> tempLabels = [];
        List<int?> tempValues = [];
        if ((value ?? '').isEmpty) {
          setState(
            () {
              toShowValues = values;
              toShowLabels = labels;
            },
          );
        } else {
          widget.monthsMap.forEach((key, mapValue) {
            if (mapValue.contains(value)) {
              tempValues.add(key);
              tempLabels.add(Text(mapValue));
            }
          });
          setState(() {
            toShowValues = tempValues;
            toShowLabels = tempLabels;
          });
        }
      },
      onChange: (value) => setState(() => this.value = value),
      multiselect: false,
      itemTrailing: widget.itemTrailing,
      actions: [
        UIKitButton.smallPrimary(
          labelText: const Text('Εντάξει'),
          onTap: () => Navigator.of(context).pop(value),
        ),
      ],
      options: toShowValues,
      labels: toShowLabels,
    );
  }
}