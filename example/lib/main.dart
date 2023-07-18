// ignore_for_file: unused_field

import 'package:example/radio_and_toggle.dart';
import 'package:example/text_input.dart';

import 'buttons.dart';
import 'check_boxes.dart';
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
      child: MaterialApp(
        title: 'Smartup UI Kit Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Smartup UI kit example'),
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
  // late TabController _tabController;
  // bool _isToggleActive = false;
  // final bool _isRadioActive = false;
  // bool _isCheckBoxChecked = false;
  // final bool _isMenuItemActive = false;
  // int? _selectedRadioItem;
  // String? dropdownValue;
  // TextEditingController controller = TextEditingController();
  // late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    // focusNode = FocusNode();
    // _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // focusNode.dispose();
    // _tabController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: Text("UIKit Demo"),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RadioAndToggle()),
                  );
                },
                label: const Text("Radio and Toggle"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DatePicker()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Buttons()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckBoxes()),
                  );
                },
                label: const Text("Check Boxes"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UIKitMenuItem(
                isActive: true,
                isExpanded: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TextInput()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DropDownMenu()),
                  );
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
                    ))),
          ],
        ),
      ),
    );
    //   return GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text(widget.title),
    //         bottom: TabBar(
    //           controller: _tabController,
    //           padding: const EdgeInsets.all(8),
    //           indicatorWeight: 0,
    //           indicatorColor: Colors.transparent,
    //           indicator: const BoxDecoration(),
    //           onTap: (value) => setState(() {}),
    //           tabs: [
    //             UIKitTab.line(
    //               label: const Text('Buttons'),
    //               leading: const UIKitIcon.asset('assets/images/url.svg'),
    //               isActive: _tabController.index == 0,
    //               onTap: () => setState(() => _tabController.index = 0),
    //             ),
    //             UIKitTab.page(
    //               label: const Text('Radio'),
    //               leading: const UIKitIcon.asset('assets/images/url.svg'),
    //               isActive: _tabController.index == 1,
    //               onTap: () => setState(() => _tabController.index = 1),
    //             ),
    //             UIKitTab.page(
    //               label: const Text('Buttons'),
    //               leading: const UIKitIcon.asset('assets/images/url.svg'),
    //               isActive: _tabController.index == 2,
    //               onTap: () => setState(() => _tabController.index = 2),
    //             ),
    //           ],
    //         ),
    //       ),
    //       drawer: const Drawer(
    //         child: Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               UIKitMenuItem(
    //                 isActive: false,
    //                 isExpanded: true,
    //                 label: Text('Buttons'),
    //                 icon: UIKitIcon.asset('assets/images/url.svg'),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       body: TabBarView(
    //         controller: _tabController,
    //         children: [
    //           ListView(
    //             padding: const EdgeInsets.all(16),
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       UIKitButton.mediumPrimary(
    //                         labelText: const Text('Button'),
    //                         leading:
    //                             const UIKitIcon.asset('assets/images/url.svg'),
    //                         onTap: (){},
    //                       ),
    //                       UIKitButton.mediumTertiary(
    //                         labelText: const Text('Button'),
    //                         leading:
    //                             const UIKitIcon.asset('assets/images/url.svg'),
    //                         onTap: () {},
    //                       ),
    //                       UIKitButton.largeOutline(
    //                         labelText: const Text('Button'),
    //                         leading:
    //                             const UIKitIcon.asset('assets/images/url.svg'),
    //                         onTap: () {},
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(height: 8),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       UIKitIconButton.smallSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.mediumSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.largeSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.smallSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.mediumSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.largeSolid(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(height: 8),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       UIKitIconButton.smallGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.mediumGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.largeGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: false,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.smallGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.mediumGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                       UIKitIconButton.largeGhost(
    //                         icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                         isCircle: true,
    //                         onTap: () {},
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               const Row(
    //                 children: [
    //                   SizedBox(width: 50),
    //                   Expanded(child: LeaveTypeSelector()),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               Row(
    //                 children: [
    //                   UIKitToggleSwitch.large(
    //                     isActive: _isToggleActive,
    //                     onTap: () =>
    //                         setState(() => _isToggleActive = !_isToggleActive),
    //                   ),
    //                   const SizedBox(width: 16),
    //                   UIKitToggleSwitch.small(
    //                     isActive: _isToggleActive,
    //                     icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                     onTap: () =>
    //                         setState(() => _isToggleActive = !_isToggleActive),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               Row(
    //                 children: [
    //                   UIKitCheckbox(
    //                     icon: const UIKitIcon.asset('assets/images/url.svg'),
    //                     isChecked: _isCheckBoxChecked,
    //                     onChanged: (value) => setState(
    //                       () => _isCheckBoxChecked = !_isCheckBoxChecked,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               Row(
    //                 children: [
    //                   const SizedBox(width: 200),
    //                   Expanded(
    //                     child: DateSelector(dateMustBeAfter: DateTime.parse('2025-09-15', ), dateMustBeBefore: DateTime.parse('2027-03-12')),
    //                     //child: DateSelector(),
    //                   ),
    //                 ],
    //               ),
    //               // const SizedBox(height: 8),
    //               // const Row(
    //               //   children: [
    //               //     Expanded(
    //               //       child: UIKitDatePicker(
    //               //         isRangePicker: false,
    //               //         dropdownButtonTrailing:
    //               //             UIKitIcon.asset('assets/images/url.svg'),
    //               //         dropdownMenuItemTrailing:
    //               //             UIKitIcon.asset('assets/images/url.svg'),
    //               //       ),
    //               //     ),
    //               //   ],
    //               // ),
    //             ],
    //           ),
    //           ListView(
    //             padding: const EdgeInsets.all(16),
    //             children: [
    //               UIKitRadioGroup.small(
    //                 isVertical: false,
    //                 initialSelectedIndex: _selectedRadioItem,
    //                 onTap: (index) => setState(() => _selectedRadioItem = index),
    //                 label: const Text('Label'),
    //                 assistiveText: const Text('Assistive text'),
    //                 errorIcon: const UIKitIcon.asset('assets/images/url.svg'),
    //                 optionLabels: const [
    //                   Text('Option1'),
    //                   Text('Option2'),
    //                   Text('Option3'),
    //                   Text('Option4'),
    //                   Text('Option5'),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitRadioGroup.medium(
    //                 isVertical: false,
    //                 onTap: (index) => setState(() => _selectedRadioItem = index),
    //                 label: const Text('Label'),
    //                 assistiveText: const Text('Assistive text'),
    //                 optionLabels: const [
    //                   Text('Option1'),
    //                   Text('Option2'),
    //                   Text('Option3'),
    //                   Text('Option4'),
    //                   Text('Option5'),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitRadioGroup.large(
    //                 isVertical: false,
    //                 onTap: (index) => setState(() => _selectedRadioItem = index),
    //                 label: const Text('Label'),
    //                 assistiveText: const Text('Assistive text'),
    //                 optionLabels: const [
    //                   Text('Option1'),
    //                   Text('Option2'),
    //                   Text('Option3'),
    //                   Text('Option4'),
    //                   Text('Option5'),
    //                 ],
    //               ),
    //               const SizedBox(height: 8),
    //             ],
    //           ),
    //           ListView(
    //             padding: const EdgeInsets.all(16),
    //             children: [
    //               UIKitTextInput.largeFilledInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.mediumFilledInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.smallFilledInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.largeLineInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.mediumLineInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.smallLineInput(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 label: const Text('Test'),
    //                 assistiveText: const Text('Test'),
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.largeFilledSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.mediumFilledSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.smallFilledSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.largeLineSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.mediumLineSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //               const SizedBox(height: 8),
    //               UIKitTextInput.smallLineSearch(
    //                 controller: controller,
    //                 focusNode: focusNode,
    //                 leading: const UIKitIcon.asset('assets/images/url.svg'),
    //                 trailing: const UIKitIcon.asset('assets/images/url.svg'),
    //                 onSubmitted: (_) {},
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}