import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class RadioToggleAndCheckBox extends HookWidget {
  const RadioToggleAndCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final toggle1$ = useState(true);
    final toggle2$ = useState(true);
    final text1$ = useState("Select an Option");
    final text2$ = useState("Select an Option");
    final text3$ = useState("Select an Option");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Date Picker"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("UIKitRadioButton"),
              const SizedBox(height: 10),
              UIKitRadioButton(isSelected: true, onTap: () {}),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UIKitRadioGroup.large(
                    label: const Text("UIKitRadioGroup.large"),
                    onTap: (value) {
                      text1$.value = "You selected $value";
                    },
                    optionLabels: const [
                      Text("Option 1"),
                      Text("Option 2"),
                      Text("Option 3"),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Text(text1$.value),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UIKitRadioGroup.medium(
                    label: const Text("UIKitRadioGroup.medium"),
                    onTap: (value) {
                      text2$.value = "You selected $value";
                    },
                    optionLabels: const [
                      Text("Option 1"),
                      Text("Option 2"),
                      Text("Option 3"),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Text(text2$.value),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UIKitRadioGroup.small(
                    label: const Text("UIKitRadioGroup.small"),
                    onTap: (value) {
                      text3$.value = "You selected $value";
                    },
                    optionLabels: const [
                      Text("Option 1"),
                      Text("Option 2"),
                      Text("Option 3"),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Text(text3$.value),
                ],
              ),
              const SizedBox(height: 40),
              const Text("UIKitRadioButton"),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: UIKitToggleSwitch.small(
                      isActive: toggle1$.value,
                      onTap: () {
                        toggle1$.value = !toggle1$.value;
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(toggle1$.value.toString()),
                ],
              ),
              const SizedBox(height: 40),
              const Text("UIKitRadioButton"),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: UIKitToggleSwitch.large(
                      isActive: toggle2$.value,
                      onTap: () {
                        toggle2$.value = !toggle2$.value;
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(toggle2$.value.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}