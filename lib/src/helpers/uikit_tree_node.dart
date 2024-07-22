abstract class UIKitTreeNode<T> {
  UIKitTreeNode({
    required this.id,
    this.parentId,
  });

  final T id;
  final T? parentId;
}
