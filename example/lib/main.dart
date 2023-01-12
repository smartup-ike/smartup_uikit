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
  bool _isToggleActive = false;
  bool _isCheckBoxChecked = false;
  int? _selectedRadioItem;

  @override
  Widget build(BuildContext context) {
    return SUTheme(
      theme: SUThemeData(
        buttonThemeData: SUButtonThemeData(
          primaryColorScheme: UIKitColorScheme(
            defaultBackgroundColor: Colors.red,
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
                UIKitButton.primary(
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
              isVertical: false,
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
              getSelected: (index) =>
                  setState(() => _selectedRadioItem = index),
            ),
            const SizedBox(height: 8),
            UIKitToggleSwitch(
              hasIcon: true,
              isActive: _isToggleActive,
              onTap: () => setState(() => _isToggleActive = !_isToggleActive),
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
              isChecked: _isCheckBoxChecked,
              onChanged: (value) =>
                  setState(() => _isCheckBoxChecked = value ?? false),
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
          ],
        ),
      ),
    );
  }
}
