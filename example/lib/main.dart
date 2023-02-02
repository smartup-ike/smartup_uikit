import 'package:example/leave_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      theme: _MyHomePageState.theme,
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
  bool _isCheckBoxChecked = false;
  bool _isMenuItemActive = false;
  int? _selectedRadioItem;
  String? _selectedDropdownItem;
  String? dropdownValue;
  TextEditingController controller = TextEditingController();
  late FocusNode focusNode;
  static final theme = SUThemeData(
    buttonThemeData: UIKitButtonThemeData(
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
        hoverBorderColor: Colors.black,
        focusedBorderColor: Colors.black,
        activeBorderColor: Colors.black,
        disabledBorderColor: Colors.black,
      ),
      ghostColorScheme: UIKitColorScheme(
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
        hoverBorderColor: Colors.black,
        focusedBorderColor: Colors.black,
        activeBorderColor: Colors.black,
        disabledBorderColor: Colors.black,
      ),
    ),
    textInputThemeData: UIKitTextInputThemeData(
      filledInputcolorScheme: UIKitColorScheme(
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
        hoverBorderColor: Colors.black,
        focusedBorderColor: Colors.black,
        activeBorderColor: Colors.black,
        disabledBorderColor: Colors.black,
      ),
    ),
  );

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
                const SizedBox(width: 12),
                UIKitIconButton.primary(
                  icon: const UIKitIcon.asset('assets/images/url.svg'),
                  sizeScheme: UIKitSizeScheme(
                    height: 40,
                    iconSize: 24,
                    borderSize: 1,
                    borderRadius: 8,
                    pressedBorderSize: 1,
                  ),
                  isCircle: true,
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
                  sizeScheme: UIKitSizeScheme(
                    borderSize: 1.6,
                    height: 16,
                    width: 16,
                    spacing: 8,
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
              sizeScheme: UIKitSizeScheme(
                borderSize: 1.6,
                height: 16,
                width: 16,
                spacing: 8,
              ),
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
              sizeScheme: UIKitSizeScheme(
                height: 24,
                spacing: 20,
                borderRadius: 10,
                width: 48,
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
            const SizedBox(height: 8),
            Row(
              children: [
                UIKitTab.line(
                  onTap: () {},
                  leading: const Icon(Icons.gamepad_rounded),
                  label: const Text('Label'),
                  isActive: false,
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
                    focusedBorderColor: Colors.deepPurpleAccent,
                    activeBorderColor: Colors.orange,
                    disabledBorderColor: Colors.grey,
                  ),
                  sizeScheme: UIKitSizeScheme(
                    width: 50,
                    borderRadius: 8,
                    pressedBorderSize: 1,
                    borderSize: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    spacing: 8,
                  ),
                ),
                const SizedBox(width: 8),
                UIKitTab.page(
                  onTap: () {},
                  leading: const Icon(Icons.gamepad_rounded),
                  label: const Text('Label'),
                  isActive: false,
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
                    focusedBorderColor: Colors.deepPurpleAccent,
                    activeBorderColor: Colors.orange,
                    disabledBorderColor: Colors.grey,
                  ),
                  sizeScheme: UIKitSizeScheme(
                    width: 50,
                    borderRadius: 8,
                    pressedBorderSize: 1,
                    borderSize: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    spacing: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const LeaveTypeSelector(),
            const SizedBox(height: 8),
            UIKitTextInput.filledInput(
              controller: controller,
              focusNode: focusNode,
              isDisabled: false,
              leading: Icon(Icons.nat_rounded),
              trailing: Icon(Icons.arrow_drop_down_rounded),
              assistiveText: const Text('Assist'),
              colorScheme: UIKitColorScheme(
                defaultBackgroundColor: Colors.tealAccent,
                hoverBackgroundColor: Colors.green,
                focusedBackgroundColor: Colors.red,
                activeBackgroundColor: Colors.orange,
                disabledBackgroundColor: Colors.grey,
                defaultContentColor: Colors.black,
                hoverContentColor: Colors.black,
                focusedContentColor: Colors.black,
                activeContentColor: Colors.black,
                disabledContentColor: Colors.black,
                defaultBorderColor: Colors.black,
                hoverBorderColor: Colors.green,
                focusedBorderColor: Colors.deepPurpleAccent,
                activeBorderColor: Colors.orange,
                disabledBorderColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                UIKitMenuItem(
                  label: const Text('Label'),
                  icon: const UIKitIcon.asset('assets/images/url.svg'),
                  isActive: false,
                  isExpanded: _isMenuItemActive,
                  onTap: () => setState(
                    () => _isMenuItemActive = !_isMenuItemActive,
                  ),
                  colorScheme: UIKitColorScheme(
                    defaultBackgroundColor: Colors.tealAccent,
                    hoverBackgroundColor: Colors.green,
                    focusedBackgroundColor: Colors.red,
                    activeBackgroundColor: Colors.orange,
                    disabledBackgroundColor: Colors.grey,
                    defaultContentColor: Colors.redAccent,
                    hoverContentColor: Colors.black,
                    focusedContentColor: Colors.black,
                    activeContentColor: Colors.black,
                    disabledContentColor: Colors.black,
                    defaultBorderColor: Colors.black,
                    hoverBorderColor: Colors.green,
                    focusedBorderColor: Colors.deepPurpleAccent,
                    activeBorderColor: Colors.orange,
                    disabledBorderColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
