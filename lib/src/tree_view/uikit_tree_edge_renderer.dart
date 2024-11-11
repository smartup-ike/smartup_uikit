import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/tree_view/uikit_buchheim_walker_configuration.dart';
import 'package:smartup_uikit/src/tree_view/uikit_edge_renderer.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph.dart';

class TreeEdgeRenderer extends EdgeRenderer {
  BuchheimWalkerConfiguration configuration;

  TreeEdgeRenderer(this.configuration);

  var linePath = Path();

  @override
  void render(Canvas canvas, UIKitGraph graph, Paint paint) {
    var levelSeparationHalf = configuration.levelSeparation / 2;

    for (var node in graph.nodes) {
      var children = graph.successorsOf(node);

      for (var child in children) {
        var edge = graph.getEdgeBetween(node, child);
        var edgePaint = (edge?.paint ?? paint)..style = PaintingStyle.stroke;
        linePath.reset();
        switch (configuration.orientation) {
          case BuchheimWalkerConfiguration.orientationTopBottom:
            // position at the middle-top of the child
            linePath.moveTo((child.x + child.width / 2), child.y);
            // draws a line from the child's middle-top halfway up to its parent
            linePath.lineTo(
                child.x + child.width / 2, child.y - levelSeparationHalf);
            // draws a line from the previous point to the middle of the parents width
            linePath.lineTo(
                node.x + node.width / 2, child.y - levelSeparationHalf);

            // position at the middle of the level separation under the parent
            linePath.moveTo(
                node.x + node.width / 2, child.y - levelSeparationHalf);
            // draws a line up to the parents middle-bottom
            linePath.lineTo(node.x + node.width / 2, node.y + node.height);

            break;
          case BuchheimWalkerConfiguration.orientationBottomTop:
            linePath.moveTo(child.x + child.width / 2, child.y + child.height);
            linePath.lineTo(child.x + child.width / 2,
                child.y + child.height + levelSeparationHalf);
            linePath.lineTo(node.x + node.width / 2,
                child.y + child.height + levelSeparationHalf);

            linePath.moveTo(node.x + node.width / 2,
                child.y + child.height + levelSeparationHalf);
            linePath.lineTo(node.x + node.width / 2, node.y + node.height);

            break;
          case BuchheimWalkerConfiguration.orientationLeftRight:
            linePath.moveTo(child.x, child.y + child.height / 2);
            linePath.lineTo(
                child.x - levelSeparationHalf, child.y + child.height / 2);
            linePath.lineTo(
                child.x - levelSeparationHalf, node.y + node.height / 2);

            linePath.moveTo(
                child.x - levelSeparationHalf, node.y + node.height / 2);
            linePath.lineTo(node.x + node.width, node.y + node.height / 2);

            break;
          case BuchheimWalkerConfiguration.orientationRightLeft:
            linePath.moveTo(child.x + child.width, child.y + child.height / 2);
            linePath.lineTo(child.x + child.width + levelSeparationHalf,
                child.y + child.height / 2);
            linePath.lineTo(child.x + child.width + levelSeparationHalf,
                node.y + node.height / 2);

            linePath.moveTo(child.x + child.width + levelSeparationHalf,
                node.y + node.height / 2);
            linePath.lineTo(node.x + node.width, node.y + node.height / 2);
        }

        canvas.drawPath(linePath, edgePaint);
      }
    }
  }
}
