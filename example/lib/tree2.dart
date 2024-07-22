import 'package:flutter/material.dart';

class TreeNode {
  final Widget widget;
  final List<TreeNode> children;

  const TreeNode({required this.widget, this.children = const []});
}

class TreeNodeWidget extends StatelessWidget {
  final TreeNode node;

  const TreeNodeWidget({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final gkey = GlobalKey();
    return Column(
      children: [
        node.widget,
        if (node.children.isNotEmpty)
          CustomPaint(
            painter: TreePainter(gkey, node.children.length),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: node.children
                  .map((child) => Expanded(
                        child: TreeNodeWidget(key: gkey, node: child),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class TreePainter extends CustomPainter {
  final int childrenCount;
  final GlobalKey key;

  const TreePainter(this.key, this.childrenCount);

  @override
  void paint(Canvas canvas, Size size) {
    if (childrenCount == 0) return;

    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final box = key.currentContext?.findRenderObject() as RenderBox;
    print(box.size.toString());
    final o = box.localToGlobal(Offset.zero);

    final double parentX = size.width / 2;
    final double parentY = 0;

    final double spacing = size.width / (childrenCount * 2);

    for (int i = 0; i < childrenCount; i++) {
      final double childX = (i * 2 + 1) * spacing;
      final double childY = size.height - 40;

      canvas.drawLine(
        o,
        Offset(childX, childY + 20),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Tree2 extends StatelessWidget {
  const Tree2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TreeNodeWidget(
            node: TreeNode(
              widget: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.blue,
                child: const Text('Root'),
              ),
              children: [
                TreeNode(
                  widget: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.orange,
                    child: const Text('Child 1'),
                  ),
                  children: [
                    TreeNode(
                      widget: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.green,
                        child: const Text('Grandchild 1'),
                      ),
                    ),
                    TreeNode(
                      widget: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.green,
                        child: const Text('Grandchild 2'),
                      ),
                    ),
                  ],
                ),
                TreeNode(
                  widget: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.orange,
                    child: const Text('Child 2'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
