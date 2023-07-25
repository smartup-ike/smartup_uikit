import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

import 'date_selector.dart';

class Playground extends HookWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Playground"),
      ),
      body: Center(child: SizedBox(
        height: 80,
        width: 400,
        child: DateSelector(
          onChanged: (value){},
        ),
      ),),
    );
  }
}