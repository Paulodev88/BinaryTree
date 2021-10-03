import 'package:arvore_binaria/classes/classes.dart';

void main(List<String> arguments) {
  BinaryTree tree = BinaryTree(root: Node(value: 50));

  tree.insertNode(Node(value: 30), tree.getNode());
  tree.insertNode(Node(value: 60), tree.getNode());
  tree.insertNode(Node(value: 25), tree.getNode());
  tree.insertNode(Node(value: 65), tree.getNode());

  print('InOrder');
  tree.inOrder(tree.getNode());
  print('\n PosOrder');
  tree.posOrder(tree.getNode());
  print('\n PreOrder');
  tree.preOrder(tree.getNode());
}
