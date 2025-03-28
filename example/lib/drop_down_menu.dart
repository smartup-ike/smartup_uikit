import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class DropDownMenuPage extends HookWidget {
  const DropDownMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final optionsMap$ = useState({
      0000: "Option 0000",
      2: "Option 2",
      3: "Option 3",
      4: "Option 4",
      5: "Option 5",
      6: "Option 6",
      7: "Option 7",
      8: "Option 8",
      9: "Option 9",
      10: "Option 10Option 10Option 10Option 10Option 10Option 10",
      11: "Option 11",
      12: "Option 12",
      13: "Option 13",
      14: "Option 14",
      15: "Option 15",
      16: "Option 16",
      17: "Option 17",
      18: "Option 18",
      19: "Option 19",
      20: "Option 20",
      21: "Option 21",
      22: "Option 22",
      23: "Option 23",
      24: "Option 24",
      25: "Option 25",
      26: "Option 26",
      27: "Option 27",
      9999: "Option 9999",
    });
    final text$ = useState("Please pick an Option");
    final selectedValue$ = useState(1);

    final selectedValuesForMulti$ = useState<List<int?>>([1]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Drop Down Menu"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              "You picked: ${text$.value}",
              style: UIKitTheme.of(context).typography.headings3Bold,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: UIKitDropdownButton.largeLine(
                label: const Text("Pick an Option"),
                input: Text(selectedValue$.value.toString()),
                isDisabled: false,
                trailing: const Icon(Icons.add_circle),
                onTap: (position, size) async {
                  selectedValue$.value = await Navigator.of(context).push(
                        UIKitDropdownRoute(
                          child: SingleOptionsSelectorDialog(
                            initialValue: selectedValue$.value,
                            optionsMap: optionsMap$.value,
                          ),
                          position: position,
                          size: size,
                        ),
                      ) ??
                      selectedValue$.value;
                  text$.value = selectedValue$.value.toString();
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 400,
              child: UIKitDropdownButton.largeLine(
                label: const Text("Pick Many Options"),
                input: Text(selectedValuesForMulti$.value.toString()),
                isDisabled: false,
                trailing: const Icon(Icons.add_circle),
                onTap: (position, size) async {
                  selectedValuesForMulti$.value =
                      await Navigator.of(context).push(
                            UIKitDropdownRoute(
                              child: MultiOptionsSelectorDialog(
                                initialValue: const [],
                                optionsMap: optionsMap$.value,
                              ),
                              position: position,
                              size: size,
                            ),
                          ) ??
                          selectedValuesForMulti$.value;
                  text$.value = selectedValuesForMulti$.value.toString();
                },
              ),
            ),
            SizedBox(
              width: 400,
              child: UIKitDropdownButton.largeFilled(
                label: const Text("Επιλέξτε έτος"),
                input: const Text("Επιλέξτε έτος"),
                isDisabled: false,
                trailing: const Icon(Icons.add_circle),
                onTap: (position, size) async {
                  await Navigator.of(context).push(
                    UIKitDropdownRoute(
                      child: const SizedBox.square(),
                      position: position,
                      size: size,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MultiOptionsSelectorDialog extends HookWidget {
  const MultiOptionsSelectorDialog({
    super.key,
    this.initialValue = const [],
    required this.optionsMap,
  });

  final List<int?> initialValue;
  final Map<int, String>? optionsMap;

  @override
  Widget build(BuildContext context) {
    final optionsToShow$ = useState(optionsMap);
    final selectedValue$ = useState(initialValue);

    return UIKitDropdownMenuMultiSelect<int?>(
      initialValue: initialValue,
      value: selectedValue$.value,
      onChanged: (newValue) => selectedValue$.value = newValue ?? [],
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
      options: optionsToShow$.value!.keys.toList(),
      labels: List.generate(
        optionsToShow$.value!.keys.toList().length,
        (index) => Text(optionsToShow$.value!.values.toList()[index]),
      ),
    );
  }
}

class SingleOptionsSelectorDialog extends HookWidget {
  const SingleOptionsSelectorDialog({
    super.key,
    this.initialValue,
    required this.optionsMap,
  });

  final int? initialValue;
  final Map<int, String>? optionsMap;

  @override
  Widget build(BuildContext context) {
    final optionsToShow$ = useState(optionsMap);
    final selectedValue$ = useState(initialValue);

    return UIKitDropdownMenuSingleSelect<int?>(
      initialValue: initialValue,
      hasSearchBar: true,
      searchOnChange: (searchText) {
        Map<int, String>? resultsMap =
            optionsMap != null ? Map.of(optionsMap!) : {};
        resultsMap.removeWhere(
            (key, value) => !(key.toString().contains(searchText)));
        optionsToShow$.value = resultsMap;
      },
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
      options: optionsToShow$.value!.keys.toList(),
      labels: List.generate(
        optionsToShow$.value!.keys.toList().length,
        (index) => Text(optionsToShow$.value!.values.toList()[index]),
      ),
    );
  }
}
