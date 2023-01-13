import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitIconButton extends StatelessWidget {
  const UIKitIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTheme = SUTheme.of(context).buttonThemeData;
    return UIKitButton.primary();
  }
}
