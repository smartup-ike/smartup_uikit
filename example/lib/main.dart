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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIKitButton(
                  onTap: () {},
                  hasShadow: true,
                  removePadding: false,
                  sizeScheme: SizeScheme(
                    height: 40,
                    iconSize: 24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
