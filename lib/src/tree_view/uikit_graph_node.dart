import 'package:flutter/material.dart';

class UIKitGraphNode {
  UIKitGraphNode.id(dynamic id) {
    key = ValueKey(id);
  }

  ValueKey? key;

  Size size = const Size(0, 0);

  Offset position = const Offset(0, 0);

  double get height => size.height;
  double get width => size.width;
  double get x => position.dx;
  double get y => position.dy;

  set y(double value) => position = Offset(position.dx, value);
  set x(double value) => position = Offset(value, position.dy);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UIKitGraphNode && hashCode == other.hashCode;

  @override
  int get hashCode => key?.value.hashCode ?? key.hashCode;
}

class UIKitGraphEdge {
  const UIKitGraphEdge(this.source, this.destination, {this.key, this.paint});

  final UIKitGraphNode source;
  final UIKitGraphNode destination;
  final Key? key;
  final Paint? paint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UIKitGraphEdge && hashCode == other.hashCode;

  @override
  int get hashCode => key?.hashCode ?? Object.hash(source, destination);
}
