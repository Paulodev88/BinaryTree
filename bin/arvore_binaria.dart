import 'package:arvore_binaria/classes/classes.dart';

void main(List<String> arguments) {
  BinaryTree tree = BinaryTree(root: Node(value: 50));

  tree.insertNode(Node(value: 30), tree.getNode());
  tree.insertNode(Node(value: 60), tree.getNode());
  tree.insertNode(Node(value: 25), tree.getNode());
  tree.insertNode(Node(value: 65), tree.getNode());

  print('InOrder LNR');
  tree.inOrder(tree.getNode());
  print('\n PosOrder LRN');
  tree.posOrder(tree.getNode());
  print('\n PreOrder NLR');
  tree.preOrder(tree.getNode());
}
