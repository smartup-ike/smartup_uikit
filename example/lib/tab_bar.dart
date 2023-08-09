import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitTabBar extends HookWidget {
  const UIKitTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit TabBar"),
      ),
      body: const Center(
        child: Column(
          children: [
                    Text("I hold the place"),
          ],
        ),
      ),
    );
  }
}