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
      body: UIKitTabBar(
        labels: const [
          Text("Red"),
          Text("Blue"),
          Text("Buttons"),
        ],
        sizeScheme: UIKitSizeScheme(),
        children: [
          UIKitButton.largePrimary(
            labelText: const Text("Button"),
            onTap: () {},
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.blue,
              height: 200,
              width: 400,
            ),
          ),
          const Column(
            children: [
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci justo, faucibus at volutpat scelerisque, sagittis id sem. Nam porta laoreet ipsum, in condimentum nibh lacinia fringilla. Sed ultrices, tortor vulputate ultricies laoreet."),
              UIKitButton.mediumOutline(),
              SizedBox(
                height: 200,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci justo, faucibus at volutpat scelerisque, sagittis id sem. Nam porta laoreet ipsum, in condimentum nibh lacinia fringilla. Sed ultrices, tortor vulputate ultricies laoreet."),
              UIKitButton.mediumOutline(),
            ],
          )
        ],
      ),
    );
  }
}