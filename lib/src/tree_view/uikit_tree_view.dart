import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartup_uikit/src/tree_view/uikit_algorithm.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph.dart';
import 'package:smartup_uikit/src/tree_view/uikit_graph_node.dart';

typedef NodeWidgetBuilder = Widget Function(UIKitGraphNode node);

class GraphView extends StatefulWidget {
  final UIKitGraph graph;
  final Algorithm algorithm;
  final Paint? paint;
  final NodeWidgetBuilder builder;

  const GraphView({
    super.key,
    required this.graph,
    required this.algorithm,
    this.paint,
    required this.builder,
  });

  @override
  GraphViewState createState() => GraphViewState();
}

class GraphViewState extends State<GraphView> {
  @override
  Widget build(BuildContext context) {
    return _GraphView(
      key: widget.key,
      graph: widget.graph,
      algorithm: widget.algorithm,
      paint: widget.paint,
      builder: widget.builder,
    );
  }
}

class _GraphView extends MultiChildRenderObjectWidget {
  final UIKitGraph graph;
  final Algorithm algorithm;
  final Paint? paint;

  _GraphView({
    super.key,
    required this.graph,
    required this.algorithm,
    this.paint,
    required NodeWidgetBuilder builder,
  }) : super(children: _extractChildren(graph, builder)) {
    assert(() {
      if (children.isEmpty) {
        throw FlutterError(
          'Children must not be empty, ensure you are overriding the builder',
        );
      }

      return true;
    }());
  }

  // Traverses the nodes depth-first collects the list of child widgets that are created.
  static List<Widget> _extractChildren(
      UIKitGraph graph, NodeWidgetBuilder builder) {
    final result = <Widget>[];

    for (var node in graph.nodes) {
      var widget = builder(node);
      result.add(widget);
    }

    return result;
  }

  @override
  RenderCustomLayoutBox createRenderObject(BuildContext context) {
    return RenderCustomLayoutBox(graph, algorithm, paint);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomLayoutBox renderObject) {
    renderObject
      ..graph = graph
      ..algorithm = algorithm
      ..edgePaint = paint;
  }
}

class RenderCustomLayoutBox extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, NodeBoxData>,
        RenderBoxContainerDefaultsMixin<RenderBox, NodeBoxData> {
  late UIKitGraph _graph;
  late Algorithm _algorithm;
  late Paint _paint;

  RenderCustomLayoutBox(
    UIKitGraph graph,
    Algorithm algorithm,
    Paint? paint, {
    List<RenderBox>? children,
  }) {
    _algorithm = algorithm;
    _graph = graph;
    edgePaint = paint;
    addAll(children);
  }

  Paint get edgePaint => _paint;

  set edgePaint(Paint? value) {
    _paint = value ??
        (Paint()
          ..color = Colors.black
          ..strokeWidth = 3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
    markNeedsPaint();
  }

  UIKitGraph get graph => _graph;

  set graph(UIKitGraph value) {
    _graph = value;
    markNeedsLayout();
  }

  Algorithm get algorithm => _algorithm;

  set algorithm(Algorithm value) {
    _algorithm = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! NodeBoxData) {
      child.parentData = NodeBoxData();
    }
  }

  @override
  void performLayout() {
    if (childCount == 0) {
      size = constraints.biggest;
      assert(size.isFinite);
      return;
    }

    var child = firstChild;
    var position = 0;
    var looseConstraints = BoxConstraints.loose(constraints.biggest);
    while (child != null) {
      final node = child.parentData as NodeBoxData;

      child.layout(looseConstraints, parentUsesSize: true);
      graph.getNodeAtPosition(position).size = child.size;

      child = node.nextSibling;
      position++;
    }

    size = algorithm.run(graph, 10, 10);

    child = firstChild;
    position = 0;
    while (child != null) {
      final node = child.parentData as NodeBoxData;

      node.offset = graph.getNodeAtPosition(position).position;

      child = node.nextSibling;
      position++;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    algorithm.renderer?.render(context.canvas, graph, edgePaint);

    context.canvas.restore();

    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<UIKitGraph>('graph', graph));
    properties.add(DiagnosticsProperty<Algorithm>('algorithm', algorithm));
    properties.add(DiagnosticsProperty<Paint>('paint', edgePaint));
  }
}

class NodeBoxData extends ContainerBoxParentData<RenderBox> {}

class EdgeRender extends CustomPainter {
  Algorithm algorithm;
  UIKitGraph graph;
  Offset offset;

  EdgeRender(this.algorithm, this.graph, this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    var edgePaint = (Paint()
      ..color = Colors.black
      ..strokeWidth = 3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    algorithm.renderer!.render(canvas, graph, edgePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
