import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class Playground extends HookWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Playground"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            UIKitIconButton.largeGhost(
              icon: Icon(Icons.account_box_rounded),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}