import 'dart:math';
import 'package:example/tree2.dart';
import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Tree2();
    final r = Random();
    final nodes = List.generate(50, (i) => MyNode(id: i, parentId: null));
    for (var i = 1; i < nodes.length; i++) {
      nodes[i].parentId = r.nextInt(50);
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: UIKitTreeView(
                nodes: nodes,
                nodeWidgetBuilder: (context, node, gkey) {
                  return Container(
                    key: gkey,
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Center(
                      child: Text('${node.id} -> ${node.parentId}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNode implements UIKitTreeNode<int> {
  MyNode({
    required this.id,
    required this.parentId,
  });

  @override
  final int id;

  @override
  int? parentId;

  @override
  String toString() {
    return '${id.toString()} -> ${parentId.toString()}';
  }
}
