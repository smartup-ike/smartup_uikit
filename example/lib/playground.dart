import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class Playground extends HookWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    final optionsMap = {
      1: "Option 1",
      2: "Option 2",
      3: "Option 3",
      4: "Option 4"
    };
    final text$ = useState("Please pick an Option");
    final selectedValue$ = useState(1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Playground"),
      ),
      body: Center(
        child: Column(

          children: [
            const SizedBox(height: 50),
            Text("You picked: ${text$.value}", style: UIKitTheme.of(context).typography.headings3Bold,),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: UIKitDropdownButton.mediumFilled(
                label: const Text("Pick an Option"),
                input: Text(selectedValue$.value.toString()),
                isDisabled: false,
                trailing: const Icon(Icons.add_circle),
                onTap: (position, size) async {
                  selectedValue$.value = await Navigator.of(context).push(
                    UIKitDropdownRoute(
                      child: OptionsSelectorDialog(
                        initialValue: selectedValue$.value,
                        optionsMap: optionsMap,
                      ),
                      position: position,
                      size: size,
                    ),
                  ) ??
                      selectedValue$.value;
                  // if (selectedValue$.value !=null) {
                  //   selectedValue$.value = ;
                  // }
                  text$.value = selectedValue$.value.toString();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OptionsSelectorDialog extends HookWidget {
  const OptionsSelectorDialog({super.key,
    this.initialValue,
    this.optionsMap,
  });


  final int? initialValue;
  final Map<int, String>? optionsMap;
  @override
  Widget build(BuildContext context) {
    final selectedValue$ = useState(initialValue);

    return UIKitDropdownMenu<int?>(
      initialValue: [initialValue],
      value: [selectedValue$.value],
      onChange: (newValue) {
        selectedValue$.value = newValue.first;
        // Navigator.of(context).pop(selectedValue$.value);
      },
      multiselect: false,
      itemTrailing: const Icon(Icons.add_circle),
      actions: [
        UIKitButton.smallOutline(
          labelText: const Text('Ακύρωση'),
          onTap: () => Navigator.of(context).pop(initialValue),
        ),
        const SizedBox(width: 8),
        UIKitButton.smallPrimary(
          labelText: const Text('Εντάξει'),
          onTap: () => Navigator.of(context).pop(selectedValue$.value),
        ),
      ],
      options: optionsMap!.keys.toList(),
      labels: List.generate(
        optionsMap!.keys.toList().length,
            (index) => Text(optionsMap!.values.toList()[index]),
      ),
    );
  }
}