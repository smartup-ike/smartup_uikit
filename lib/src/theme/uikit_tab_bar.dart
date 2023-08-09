import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitTabBar extends HookWidget {
  final UIKitSizeScheme sizeScheme;
  final List<Widget> labels;

  const UIKitTabBar({
    super.key,
    required this.labels,
    required this.sizeScheme,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}