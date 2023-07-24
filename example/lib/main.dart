// ignore_for_file: unused_field
import 'package:go_router/go_router.dart';

import 'package:example/radio_toggle_and_checkbox.dart';
import 'package:example/text_input.dart';

import 'buttons.dart';
import 'config/app_router.dart';
import 'constants/theme/example_theme_data_constants.dart';
import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

import 'date_picker.dart';
import 'drop_down_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UIKitTheme(
      theme: kitThemeData,
      child: MaterialApp.router(
        title: 'Smartup UI Kit Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
        //home: const MyHomePage(title: 'Smartup UI kit example'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Demo"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  context.go("/radioToggleAndCheckBox");
                },
                label: const Text("Radio, Toggle and CheckBox"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  context.go("/datePicker");
                },
                label: const Text("Date Picker"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  context.go("/buttons");
                },
                label: const Text("Buttons"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  context.go("/textInput");
                },
                label: const Text("Text Input"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  context.go("/dropDownMenuPage");
                },
                label: const Text("Drop Down Menu"),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: '',
                style: const TextStyle(color: Colors.red),
                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                      text: 'Smart ',
                      style: UIKitTheme.of(context)
                          .typography
                          .headings1Bold
                          ?.copyWith(color: Colors.black54)),
                  TextSpan(
                      text: 'Up',
                      style: UIKitTheme.of(context)
                          .typography
                          .headings1Bold
                          ?.copyWith(color: Colors.green)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Welcome to UIKit!",
              style: UIKitTheme.of(context).typography.headings1Bold,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
                child: Text(
                  "UIKit is a collection of reusable widgets. In this demo you can test many examples of buttons, drop down menus, check boxes, toggle switches, text inputs, date pickers and more. Feel free to browse the collection and see what's available."
                  "\n\n Tip: Always use named constructors if available.",
                  style: UIKitTheme.of(context).typography.body1Regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}