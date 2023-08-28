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
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: UIKitTabBar(
              labels: const [
                Text("1Red"),
                Text("2Blue"),
                Text("3ButtonsButton"),
                Text("4ButtonsButton"),
                Text("5ButtonsButton"),
                Text("6ButtonsButton"),
                Text("7ButtonsButton"),
                Text("8ButtonsButton"),
                Text("9ButtonsButton"),
                Text("10ButtonsButton"),
                Text("11ButtonsButton"),
                Text("12ButtonsButton"),
                Text("13ButtonsButton"),
                Text("14ButtonsButton"),

              ],
              sizeScheme: UIKitSizeScheme(),
              children: [
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
                const Center(child: Text("Button"),),
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
          ),
          SizedBox(
            height: 500,
            width: 500,
            child: UIKitTabBar(
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
          ),
          SizedBox(
            height: 500,
            width: 500,
            child: UIKitTabBar(
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
          ),
        ],
      ),
    );
  }
}