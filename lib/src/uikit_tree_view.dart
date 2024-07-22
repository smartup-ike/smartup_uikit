import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_tree_node.dart';

class UIKitTreeView extends HookWidget {
  const UIKitTreeView({
    super.key,
    required this.nodes,
    required this.nodeWidgetBuilder,
  });

  final List<UIKitTreeNode> nodes;
  final Widget Function(BuildContext, UIKitTreeNode, GlobalKey)
      nodeWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final keyNodeMap = useNodes();
    final levels = useLevels();
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomPaint(
        painter: UIKitTreePainter(keyNodeMap: keyNodeMap),
        child: Column(
          children: [
            for (var l in levels.entries) ...[
              Row(
                children: [
                  for (var node in l.value)
                    nodeWidgetBuilder(
                      context,
                      node,
                      keyNodeMap[node]!,
                    ),
                ],
              ),
            ],
            // for (var entry in keyNodeMap.entries) ...[
            //   nodeWidgetBuilder(context, entry.key, entry.value),
            //   const SizedBox(height: 8),
            // ],
          ],
        ),
      ),
    );
  }

  Map<UIKitTreeNode, GlobalKey> useNodes() {
    final temp = <UIKitTreeNode, GlobalKey>{};
    temp.addAll({for (var node in nodes) node: GlobalKey()});
    return temp;
  }

  Map<int, List<UIKitTreeNode>> useLevels() {
    final temp = <int, List<UIKitTreeNode>>{};
    int i = 0;
    temp.putIfAbsent(i, () => nodes.where((n) => n.parentId == null).toList());
    while (true) {
      final prevLevelIds = temp[i]?.map((n) => n.id);
      final nextLevel =
          nodes.where((n) => prevLevelIds?.contains(n.parentId) == true);
      if (nextLevel.isEmpty) {
        break;
      }
      i++;
      temp.addAll({i: nextLevel.toList()});
    }

    return temp;
  }
}

class UIKitTreePainter extends CustomPainter {
  UIKitTreePainter({
    super.repaint,
    required this.keyNodeMap,
  });
  final Map<UIKitTreeNode, GlobalKey> keyNodeMap;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    for (var entry in keyNodeMap.entries) {
      final box = entry.value.currentContext?.findRenderObject() as RenderBox;
      final offset = box.localToGlobal(Offset.zero);
      final parentKey = keyNodeMap.entries
          .firstWhere(
            (e) => e.key.id == entry.key.parentId,
            orElse: () => entry,
          )
          .value;
      final parentBox =
          parentKey.currentContext?.findRenderObject() as RenderBox;
      final parentOffset = parentBox.localToGlobal(Offset.zero);

      canvas.drawLine(offset, parentOffset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate.shouldRepaint(oldDelegate);
}
