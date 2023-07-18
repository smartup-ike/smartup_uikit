import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class Buttons extends HookWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    //which tab is shown
    final tabIndex$ = useState(0);
    final text$ = useState("Please press a button.");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Buttons"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 30),
            child: Row(
              children: [
                UIKitTab.line(
                  isActive: tabIndex$.value == 0,
                  onTap: () => tabIndex$.value = 0,
                  leading: const SizedBox(),
                  label: const Text("Small Buttons"),
                ),
                UIKitTab.line(
                  isActive: tabIndex$.value == 1,
                  onTap: () => tabIndex$.value = 1,
                  leading: const SizedBox(),
                  label: const Text("Medium Butons"),
                ),
                UIKitTab.line(
                  isActive: tabIndex$.value == 2,
                  onTap: () => tabIndex$.value = 2,
                  leading: const SizedBox(),
                  label: const Text("Large Butons"),
                ),
                const SizedBox(width: 80),
                Text(
                  text$.value,
                  style: UIKitTheme.of(context).typography.headings3Bold,
                ),
              ],
            ),
          ),
          if (tabIndex$.value == 0)
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  UIKitButton.smallSecondaryWhite(
                    onTap: () {
                      text$.value = "smallSecondaryWhite";
                    },
                    labelText: const Text("smallSecondaryWhite"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.smallSecondary(
                    onTap: () {
                      text$.value = "smallSecondary";
                    },
                    labelText: const Text("smallSecondary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.smallGhost(
                    onTap: () {
                      text$.value = "smallGhost";
                    },
                    labelText: const Text("smallGhost"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.smallOutline(
                    onTap: () {
                      text$.value = "smallOutline";
                    },
                    labelText: const Text("smallOutline"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.smallPrimary(
                    onTap: () {
                      text$.value = "smallPrimary";
                    },
                    labelText: const Text("smallPrimary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.smallTertiary(
                    onTap: () {
                      text$.value = "smallTertiary";
                    },
                    labelText: const Text("smallTertiary"),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          if (tabIndex$.value == 1)
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  UIKitButton.mediumGhost(
                    onTap: () {
                      text$.value = "mediumGhost";
                    },
                    labelText: const Text("mediumGhost"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.mediumOutline(
                    onTap: () {
                      text$.value = "mediumOutline";
                    },
                    labelText: const Text("mediumOutline"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.mediumPrimary(
                    onTap: () {
                      text$.value = "mediumPrimary";
                    },
                    labelText: const Text("mediumPrimary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.mediumSecondaryWhite(
                    onTap: () {
                      text$.value = "mediumSecondaryWhite";
                    },
                    labelText: const Text("mediumSecondaryWhite"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.mediumTertiary(
                    onTap: () {
                      text$.value = "mediumTertiary";
                    },
                    labelText: const Text("mediumTertiary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.mediumSecondary(
                    onTap: () {
                      text$.value = "mediumSecondary";
                    },
                    labelText: const Text("mediumSecondary"),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          if (tabIndex$.value == 2)
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  UIKitButton.largeGhost(
                    onTap: () {
                      text$.value = "largeGhost";
                    },
                    labelText: const Text("largeGhost"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.largeOutline(
                    onTap: () {
                      text$.value = "largeOutline";
                    },
                    labelText: const Text("largeOutline"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.largePrimary(
                    onTap: () {
                      text$.value = "largePrimary";
                    },
                    labelText: const Text("largePrimary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.lergeSecondary(
                    onTap: () {
                      text$.value = "lergeSecondary";
                    },
                    labelText: const Text("lergeSecondary"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.lergeSecondaryWhite(
                    onTap: () {
                      text$.value = "lergeSecondaryWhite";
                    },
                    labelText: const Text("lergeSecondaryWhite"),
                  ),
                  const SizedBox(height: 15),
                  UIKitButton.largeTertiary(
                    onTap: () {
                      text$.value = "largeTertiary";
                    },
                    labelText: const Text("largeTertiary"),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
        ],
      ),
    );
  }
}