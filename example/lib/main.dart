import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartup UI Kit Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Smartup UI Kit Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isToggleActive = false;
  bool isCheckBoxChecked = false;
  bool isDropdownExpanded = false;
  int? selectedRadioItem;
  Set<int?>? selectedDropdownIndexes;
  Set<int?>? innerSelectedDropdownIndexes;
  Set<int?>? innermostSelectedDropdownIndexes;

  @override
  void initState() {
    super.initState();
    selectedDropdownIndexes = {};
    innerSelectedDropdownIndexes = {};
    innermostSelectedDropdownIndexes = {};
  }

  @override
  Widget build(BuildContext context) {
    return SUTheme(
      data: SUThemeData(
        buttonThemeData: SUButtonThemeData(
          colorScheme: UIKitColorScheme(
            defaultBackgroundColor: Colors.black,
            hoverBackgroundColor: Colors.blue,
            focusedBackgroundColor: Colors.purple,
            activeBackgroundColor: Colors.teal,
            disabledBackgroundColor: Colors.grey,
            defaultContentColor: Colors.white,
            hoverContentColor: Colors.green,
            focusedContentColor: Colors.red,
            activeContentColor: Colors.orange,
            disabledContentColor: Colors.grey,
            defaultBorderColor: Colors.black,
            hoverBorderColor: Colors.green,
            focusedBorderColor: Colors.red,
            activeBorderColor: Colors.orange,
            disabledBorderColor: Colors.grey,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIKitButton(
                  labelText: const Text('Button'),
                  removePadding: false,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIKitRadioButton(
                  isSelected: true,
                  onTap: () {},
                  colorScheme: UIKitColorScheme(
                    defaultBackgroundColor: Colors.white,
                    hoverBackgroundColor: Colors.white,
                    focusedBackgroundColor: Colors.white,
                    activeBackgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.white,
                    defaultContentColor: Colors.black,
                    hoverContentColor: Colors.green,
                    focusedContentColor: Colors.red,
                    activeContentColor: Colors.orange,
                    disabledContentColor: Colors.grey,
                    defaultBorderColor: Colors.black,
                    hoverBorderColor: Colors.green,
                    focusedBorderColor: Colors.red,
                    activeBorderColor: Colors.orange,
                    disabledBorderColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            UIKitRadioGroup(
              isVertical: true,
              label: const Text('Label'),
              assistiveText: const Text('Assistive text'),
              optionLabels: const [
                Text('Test 1'),
                Text('Test 2'),
                Text('Test 3'),
                Text('Test 4'),
              ],
              colorScheme: UIKitColorScheme(
                defaultBackgroundColor: Colors.white,
                hoverBackgroundColor: Colors.white,
                focusedBackgroundColor: Colors.white,
                activeBackgroundColor: Colors.white,
                disabledBackgroundColor: Colors.white,
                defaultContentColor: Colors.black,
                hoverContentColor: Colors.green,
                focusedContentColor: Colors.red,
                activeContentColor: Colors.orange,
                disabledContentColor: Colors.grey,
                defaultBorderColor: Colors.black,
                hoverBorderColor: Colors.green,
                focusedBorderColor: Colors.red,
                activeBorderColor: Colors.orange,
                disabledBorderColor: Colors.grey,
              ),
              getSelected: (index) => setState(() => selectedRadioItem = index),
            ),
            const SizedBox(height: 8),
            UIKitToggleSwitch(
              hasIcon: true,
              isActive: isToggleActive,
              onTap: () => setState(() => isToggleActive = !isToggleActive),
              colorScheme: UIKitColorScheme(
                defaultBackgroundColor: Colors.black,
                hoverBackgroundColor: Colors.green,
                focusedBackgroundColor: Colors.red,
                activeBackgroundColor: Colors.orange,
                disabledBackgroundColor: Colors.grey,
                defaultContentColor: Colors.white,
                hoverContentColor: Colors.white,
                focusedContentColor: Colors.white,
                activeContentColor: Colors.white,
                disabledContentColor: Colors.white,
                defaultBorderColor: Colors.black,
                hoverBorderColor: Colors.green,
                focusedBorderColor: Colors.red,
                activeBorderColor: Colors.orange,
                disabledBorderColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            UIKitCheckbox(
              isChecked: isCheckBoxChecked,
              onChanged: (value) =>
                  setState(() => isCheckBoxChecked = value ?? false),
              sizeScheme: UIKitSizeScheme(
                height: 16,
              ),
              colorScheme: UIKitColorScheme(
                defaultBackgroundColor: Colors.tealAccent,
                hoverBackgroundColor: Colors.green,
                focusedBackgroundColor: Colors.red,
                activeBackgroundColor: Colors.orange,
                disabledBackgroundColor: Colors.grey,
                defaultContentColor: Colors.white,
                hoverContentColor: Colors.white,
                focusedContentColor: Colors.white,
                activeContentColor: Colors.white,
                disabledContentColor: Colors.white,
                defaultBorderColor: Colors.black,
                hoverBorderColor: Colors.green,
                focusedBorderColor: Colors.red,
                activeBorderColor: Colors.orange,
                disabledBorderColor: Colors.grey,
              ),
              icon: const Icon(
                Icons.check,
                size: 12,
              ),
            ),
            const SizedBox(height: 8),
            UIKitDropdown(
              multiselect: false,
              isExpanded: isDropdownExpanded,
              expand: (value) => setState(() => isDropdownExpanded = value),
              label: const Text('Label'),
              optionLabels: [
                const Text('Option 1'),
                const Text('Option 2'),
                const Text('Option 3'),
                UIKitDropdown(
                  isExpanded: isDropdownExpanded,
                  expand: (value) => setState(() => isDropdownExpanded = value),
                  label: const Text('Inner Label'),
                  optionLabels: [
                    const Text('Inner option 1'),
                    const Text('Inner option 2'),
                    UIKitDropdown(
                      isExpanded: isDropdownExpanded,
                      expand: (value) =>
                          setState(() => isDropdownExpanded = value),
                      label: const Text('Innermost Label'),
                      optionLabels: const [
                        Text('Innermost option 1'),
                        Text('Innermost option 2'),
                        Text('Innermost option 3'),
                      ],
                      getSelected: (set) => setState(
                        () => innermostSelectedDropdownIndexes = set,
                      ),
                      sizeScheme: UIKitSizeScheme(
                        height: 16,
                      ),
                      colorScheme: UIKitColorScheme(
                        defaultBackgroundColor: Colors.tealAccent,
                        hoverBackgroundColor: Colors.green,
                        focusedBackgroundColor: Colors.red,
                        activeBackgroundColor: Colors.orange,
                        disabledBackgroundColor: Colors.grey,
                        defaultContentColor: Colors.white,
                        hoverContentColor: Colors.white,
                        focusedContentColor: Colors.white,
                        activeContentColor: Colors.white,
                        disabledContentColor: Colors.white,
                        defaultBorderColor: Colors.black,
                        hoverBorderColor: Colors.green,
                        focusedBorderColor: Colors.red,
                        activeBorderColor: Colors.orange,
                        disabledBorderColor: Colors.grey,
                      ),
                    ),
                    const Text('Inner option 3'),
                  ],
                  getSelected: (set) => setState(
                    () => innerSelectedDropdownIndexes = set,
                  ),
                  sizeScheme: UIKitSizeScheme(
                    height: 16,
                  ),
                  colorScheme: UIKitColorScheme(
                    defaultBackgroundColor: Colors.tealAccent,
                    hoverBackgroundColor: Colors.green,
                    focusedBackgroundColor: Colors.red,
                    activeBackgroundColor: Colors.orange,
                    disabledBackgroundColor: Colors.grey,
                    defaultContentColor: Colors.white,
                    hoverContentColor: Colors.white,
                    focusedContentColor: Colors.white,
                    activeContentColor: Colors.white,
                    disabledContentColor: Colors.white,
                    defaultBorderColor: Colors.black,
                    hoverBorderColor: Colors.green,
                    focusedBorderColor: Colors.red,
                    activeBorderColor: Colors.orange,
                    disabledBorderColor: Colors.grey,
                  ),
                ),
                const Text('Option 5'),
              ],
              getSelected: (set) =>
                  setState(() => selectedDropdownIndexes = set),
              sizeScheme: UIKitSizeScheme(
                height: 16,
              ),
              colorScheme: UIKitColorScheme(
                defaultBackgroundColor: Colors.tealAccent,
                hoverBackgroundColor: Colors.green,
                focusedBackgroundColor: Colors.red,
                activeBackgroundColor: Colors.orange,
                disabledBackgroundColor: Colors.grey,
                defaultContentColor: Colors.white,
                hoverContentColor: Colors.white,
                focusedContentColor: Colors.white,
                activeContentColor: Colors.white,
                disabledContentColor: Colors.white,
                defaultBorderColor: Colors.black,
                hoverBorderColor: Colors.green,
                focusedBorderColor: Colors.red,
                activeBorderColor: Colors.orange,
                disabledBorderColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
