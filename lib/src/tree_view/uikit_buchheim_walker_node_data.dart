import 'package:smartup_uikit/src/tree_view/uikit_graph_node.dart';

class BuchheimWalkerNodeData {
  UIKitGraphNode? ancestor;
  UIKitGraphNode? thread;
  int number = 0;
  int depth = 0;
  double prelim = 0.toDouble();
  double modifier = 0.toDouble();
  double shift = 0.toDouble();
  double change = 0.toDouble();
  List<UIKitGraphNode> predecessorNodes = [];
  List<UIKitGraphNode> successorNodes = [];
}
