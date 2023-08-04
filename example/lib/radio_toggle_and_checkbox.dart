import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class RadioToggleAndCheckBox extends HookWidget {
  const RadioToggleAndCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final toggle1$ = useState(true);
    final toggle2$ = useState(true);
    final toggle3$ = useState(true);
    final check$ = useState(false);
    final text1$ = useState("Select an Option");
    final text2$ = useState("Select an Option");
    final text3$ = useState("Select an Option");
    final buttonName$ = useState("Please press a button.");
    //which tab is shown
    final tabIndex$ = useState(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Date Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80, right: 80, top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UIKitTab.line(
                    isActive: tabIndex$.value == 0,
                    onTap: () => tabIndex$.value = 0,
                    leading: const SizedBox(),
                    label: const Text("Radio Buttons"),
                  ),
                  UIKitTab.line(
                    isActive: tabIndex$.value == 1,
                    onTap: () => tabIndex$.value = 1,
                    leading: const SizedBox(),
                    label: const Text("Toggles And CheckBox"),
                  ),
                  UIKitTab.line(
                    isActive: tabIndex$.value == 2,
                    onTap: () => tabIndex$.value = 2,
                    leading: const SizedBox(),
                    label: const Text("Icon Buttons"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (tabIndex$.value == 0)
                Column(
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
                  ],
                ),
              if (tabIndex$.value == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text("UIKitToggle"),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                    const Text("UIKitToggle"),
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
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        UIKitCheckBoxListTile.mediumWithTrailing(
                          trailing: const Text("UIKitCheckBoxListTile"),
                          isChecked: check$.value,
                          onChanged: (value) {
                            check$.value = value;
                          },
                        ),
                        const SizedBox(width: 30),
                        Text(check$.value.toString()),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIKitToggleListTile.mediumWithTrailing(
                          trailing: const Text("UIKitToggleListTile"),
                          onTap: () {
                            toggle3$.value = !toggle3$.value;
                          },
                        ),
                        const SizedBox(width: 30),
                        Text(toggle3$.value.toString()),
                      ],
                    ),
                  ],
                ),
              if (tabIndex$.value == 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buttonName$.value,
                      style: UIKitTheme.of(context).typography.headings3Bold,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.mediumGhost(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.mediumGhost";
                          },
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.largeGhost(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.largeGhost";
                          },
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.smallGhost(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.smallGhost";
                          },
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.largeSolid(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.largeSolid";
                          },
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.mediumSolid(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.mediumSolid";
                          },
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: 100,
                        child: UIKitIconButton.smallSolid(
                          icon: const Icon(Icons.account_circle),
                          onTap: () {
                            buttonName$.value = "UIKitIconButton.smallSolid";
                          },
                        )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}