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
  @override
  Widget build(BuildContext context) {
    return SUTheme(
      data: SUThemeData(
          buttonThemeData: SUButtonThemeData(
              colorScheme:
                  UIKitColorScheme(defaultBackgroundColor: Colors.red))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
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
                Text('Test for testing'),
                Text('Test for testing'),
                Text('Test for testing'),
                Text('Test for testing'),
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
            ),
          ],
        ),
      ),
    );
  }
}
