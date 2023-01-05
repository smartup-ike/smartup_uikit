import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UIKitIconTheme extends StatelessWidget {
  const UIKitIconTheme({
    super.key,
    required this.child,
    this.color,
    this.size,
  });

  final Widget child;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Provider<_UIKitIconThemeData>.value(
      value: _UIKitIconThemeData(color: color, size: size),
      child: child,
    );
  }
}

class _UIKitIconThemeData {
  _UIKitIconThemeData({this.color, this.size});
  final Color? color;
  final double? size;
}

class UIKitIconSize {
  static double size16 = 16;
  static double size20 = 20;
  static double size24 = 24;
  static double size28 = 28;
  static double size32 = 32;
  static double size48 = 48;
}
