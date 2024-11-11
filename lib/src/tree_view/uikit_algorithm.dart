import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/tree_view/uikit_edge_renderer.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph_node.dart';

abstract class Algorithm {
  EdgeRenderer? renderer;

  /// Executes the algorithm.
  /// @param shiftY Shifts the y-coordinate origin
  /// @param shiftX Shifts the x-coordinate origin
  /// @return The size of the graph
  Size run(UIKitGraph? graph, double shiftX, double shiftY);

  void setFocusedNode(UIKitGraphNode node);

  void init(UIKitGraph? graph);

  void step(UIKitGraph? graph);

  void setDimensions(double width, double height);
}
