import 'package:flutter/material.dart';

class UIKitLinePainter extends CustomPainter {
  UIKitLinePainter(this.start, this.end);

  final Offset? start, end;

  @override
  void paint(Canvas canvas, Size size) {
    if (start == null || end == null) return;
    canvas.drawLine(
      start!,
      end!,
      Paint()
        ..strokeWidth = 4
        ..color = Colors.redAccent,
    );
  }

  @override
  bool shouldRepaint(UIKitLinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}
