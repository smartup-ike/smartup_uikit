import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph_node.dart';

class UIKitGraph {
  final List<UIKitGraphNode> _nodes = [];
  final List<UIKitGraphEdge> _edges = [];

  List<UIKitGraphNode> get nodes => _nodes;
  List<UIKitGraphEdge> get edges => _edges;

  int get nodeCount => _nodes.length;

  void addNode(UIKitGraphNode node) => _nodes.add(node);
  void addNodes(List<UIKitGraphNode> nodes) {
    for (var node in nodes) {
      addNode(node);
    }
  }

  void removeNode(UIKitGraphNode node) {
    final successors = successorsOf(node);
    if (successors.isNotEmpty) {
      for (var n in successors) {
        removeNode(n);
      }
    }
    _nodes.remove(node);
    _edges.removeWhere((e) => e.source == node || e.destination == node);
  }

  void removeNodes(List<UIKitGraphNode> nodes) {
    for (var node in nodes) {
      removeNode(node);
    }
  }

  void addEdge(UIKitGraphEdge edge) {
    var sourceSet = false;
    var destinationSet = false;
    for (var node in _nodes) {
      if (!sourceSet && node == edge.source) {
        sourceSet = true;
      } else if (!destinationSet && node == edge.destination) {
        destinationSet = true;
      }
    }
    if (!sourceSet) {
      _nodes.add(edge.source);
    }
    if (!destinationSet) {
      _nodes.add(edge.destination);
    }

    if (!_edges.contains(edge)) {
      _edges.add(edge);
    }
  }

  void addEdges(List<UIKitGraphEdge> edges) {
    for (var edge in edges) {
      addEdge(edge);
    }
  }

  void removeEdge(UIKitGraphEdge edge) => _edges.remove(edge);

  void removeEdges(List<UIKitGraphEdge> edges) {
    for (var edge in edges) {
      removeEdge(edge);
    }
  }

  void removeEdgeFromPredecessor(
    UIKitGraphNode? predecessor,
    UIKitGraphNode? current,
  ) =>
      _edges.removeWhere(
        (edge) => edge.source == predecessor && edge.destination == current,
      );

  bool get hasNodes => _nodes.isNotEmpty;

  UIKitGraphEdge? getEdgeBetween(
    UIKitGraphNode source,
    UIKitGraphNode? destination,
  ) =>
      _edges.firstWhere(
        (edge) => edge.source == source && edge.destination == destination,
      );

  bool hasSuccessor(UIKitGraphNode? node) =>
      _edges.any((edge) => edge.source == node);

  List<UIKitGraphNode> successorsOf(UIKitGraphNode node) =>
      getOutEdges(node).map((e) => e.destination).toList();

  bool hasPredecessor(UIKitGraphNode node) =>
      _edges.any((edge) => edge.destination == node);

  List<UIKitGraphNode> predecessorsOf(UIKitGraphNode? node) =>
      getInEdges(node!).map((edge) => edge.source).toList();

  List<UIKitGraphEdge> getOutEdges(UIKitGraphNode node) =>
      _edges.where((e) => e.source == node).toList();

  List<UIKitGraphEdge> getInEdges(UIKitGraphNode node) =>
      _edges.where((e) => e.destination == node).toList();

  bool contains({UIKitGraphNode? node, UIKitGraphEdge? edge}) =>
      node != null && _nodes.contains(node) ||
      edge != null && _edges.contains(edge);

  UIKitGraphNode getNodeAtPosition(int position) {
    if (position < 0) {}
    final size = _nodes.length;
    if (position >= size) {
      throw IndexError.withLength(position, size);
    }
    return _nodes[position];
  }

  UIKitGraphNode getNodeUsingKey(ValueKey key) =>
      _nodes.firstWhere((n) => n.key == key);

  UIKitGraphNode getNodeUsingId(dynamic id) =>
      _nodes.firstWhere((n) => n.key == ValueKey(id));
}
