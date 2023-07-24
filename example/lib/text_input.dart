import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class TextInput extends HookWidget {
  const TextInput({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textControl0 = useTextEditingController();
    final TextEditingController textControl1 = useTextEditingController();
    final TextEditingController textControl2 = useTextEditingController();
    final TextEditingController textControl3 = useTextEditingController();
    final TextEditingController textControl4 = useTextEditingController();
    final TextEditingController textControl5 = useTextEditingController();
    final TextEditingController textControl6 = useTextEditingController();
    final TextEditingController textControl7 = useTextEditingController();
    final TextEditingController textControl8 = useTextEditingController();
    final TextEditingController textControl9 = useTextEditingController();
    final TextEditingController textControl10 = useTextEditingController();
    final TextEditingController textControl11 = useTextEditingController();
    final text$ = useState("Please enter some text.");
    //which tab is shown
    final tabIndex$ = useState(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Text Input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60),
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
                    label: const Text("Large Inputs"),
                  ),
                  UIKitTab.line(
                    isActive: tabIndex$.value == 1,
                    onTap: () => tabIndex$.value = 1,
                    leading: const SizedBox(),
                    label: const Text("Medium Inputs"),
                  ),
                  UIKitTab.line(
                    isActive: tabIndex$.value == 2,
                    onTap: () => tabIndex$.value = 2,
                    leading: const SizedBox(),
                    label: const Text("Small Inputs"),
                  ),
                  const SizedBox(width: 80),
                  Text(
                    text$.value,
                    style: UIKitTheme.of(context).typography.headings3Bold,
                  ),
                ],
              ),
              tabIndex$.value == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        UIKitTextInput.largeFilledInput(
                          controller: textControl0,
                          onChanged: (value) => text$.value = value,
                          label: const Text("largeFilledInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("largeFilledSearch"),
                        UIKitTextInput.largeFilledSearch(
                          controller: textControl1,
                          onChanged: (value) => text$.value = value,
                        ),
                        const SizedBox(height: 20),
                        UIKitTextInput.largeLineInput(
                          controller: textControl2,
                          onChanged: (value) => text$.value = value,
                          label: const Text("largeLineInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("largeLineSearch"),
                        UIKitTextInput.largeLineSearch(
                            controller: textControl3,
                            onChanged: (value) => text$.value = value),
                      ],
                    )
                  : const SizedBox(),
              tabIndex$.value == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        UIKitTextInput.mediumFilledInput(
                          controller: textControl4,
                          onChanged: (value) => text$.value = value,
                          label: const Text("mediumFilledInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("mediumFilledSearch"),
                        UIKitTextInput.mediumFilledSearch(
                            controller: textControl5,
                            onChanged: (value) => text$.value = value),
                        const SizedBox(height: 20),
                        UIKitTextInput.mediumLineInput(
                          controller: textControl6,
                          onChanged: (value) => text$.value = value,
                          label: const Text("mediumLineInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("mediumLineSearch"),
                        UIKitTextInput.mediumLineSearch(
                            controller: textControl7,
                            onChanged: (value) => text$.value = value),
                      ],
                    )
                  : const SizedBox(),
              tabIndex$.value == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        UIKitTextInput.smallFilledInput(
                          controller: textControl8,
                          onChanged: (value) => text$.value = value,
                          label: const Text("smallFilledInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("smallFilledSearch"),
                        UIKitTextInput.smallFilledSearch(
                            controller: textControl9,
                            onChanged: (value) => text$.value = value),
                        const SizedBox(height: 20),
                        UIKitTextInput.smallLineInput(
                          controller: textControl10,
                          onChanged: (value) => text$.value = value,
                          label: const Text("smallLineInput"),
                        ),
                        const SizedBox(height: 20),
                        const Text("smallLineSearch"),
                        UIKitTextInput.smallLineSearch(
                            controller: textControl11,
                            onChanged: (value) => text$.value = value),
                        const SizedBox(height: 20),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}