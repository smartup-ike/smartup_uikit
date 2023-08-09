import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitTabBar extends HookWidget {
  final UIKitSizeScheme sizeScheme;
  final List<Widget> labels;
  final List<Widget> children;

  const UIKitTabBar(
      {super.key,
      required this.labels,
      required this.sizeScheme,
      required this.children})
      : assert(
          (children.length == labels.length),
          'The number of children must be equal to the number of labels.',
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int x = 1; x<=5;x++)...[
          Container(
              child: Text("$x")
          ),
        ],
      ],

    );
  }
}