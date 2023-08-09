import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class TabBarExample extends HookWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit TabBar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: UIKitTabBar(
              labels: const [
                Text("Red"),
                Text("Green"),
                Text("Blue"),
              ],
              sizeScheme: UIKitSizeScheme(),
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.red,
                ),
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.green,
                ),
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}