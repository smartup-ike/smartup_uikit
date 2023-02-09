import 'constants/theme/example_theme_data_constants.dart';
import 'leave_type_selector.dart';
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
    return UIKitTheme(
      theme: kitThemeData,
      child: MaterialApp(
        title: 'Smartup UI Kit Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Smartup UI Kit Example'),
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

class _MyHomePageState extends State<MyHomePage> {
  bool _isToggleActive = false;
  bool _isRadioActive = false;
  bool _isCheckBoxChecked = false;
  bool _isMenuItemActive = false;
  int? _selectedRadioItem;
  String? dropdownValue;
  TextEditingController controller = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                UIKitMenuItem(
                  isActive: false,
                  isExpanded: true,
                  label: Text('Buttons'),
                  icon: const UIKitIcon.asset('assets/images/url.svg'),
                )
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UIKitButton.smallGhost(
                      labelText: const Text('Button'),
                      leading: const UIKitIcon.asset('assets/images/url.svg'),
                      onTap: () {},
                    ),
                    UIKitButton.mediumTertiary(
                      labelText: const Text('Button'),
                      leading: const UIKitIcon.asset('assets/images/url.svg'),
                      onTap: () {},
                    ),
                    UIKitButton.largeOutline(
                      labelText: const Text('Button'),
                      leading: const UIKitIcon.asset('assets/images/url.svg'),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UIKitIconButton.smallSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.mediumSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.largeSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.smallSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                    UIKitIconButton.mediumSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                    UIKitIconButton.largeSolid(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UIKitIconButton.smallGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.mediumGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.largeGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: false,
                      onTap: () {},
                    ),
                    UIKitIconButton.smallGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                    UIKitIconButton.mediumGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                    UIKitIconButton.largeGhost(
                      icon: const UIKitIcon.asset('assets/images/url.svg'),
                      isCircle: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                SizedBox(width: 50),
                Expanded(child: LeaveTypeSelector()),
              ],
            ),
            const SizedBox(height: 8),
            UIKitRadioButton(
              isSelected: _isRadioActive,
              onTap: () => setState(() => _isRadioActive = !_isRadioActive),
            ),
          ],
        ),
      ),
    );
  }
}
