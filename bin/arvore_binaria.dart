import 'package:arvore_binaria/classes/classes.dart';

void main(List<String> arguments) {
  BinaryTree tree = BinaryTree(root: Node(value: 40));

  tree.insertNode(Node(value: 30), tree.getNode());
  tree.insertNode(Node(value: 70), tree.getNode());
  tree.insertNode(Node(value: 35), tree.getNode());
  tree.insertNode(Node(value: 80), tree.getNode());
  tree.insertNode(Node(value: 75), tree.getNode());

  tree.getHeight(40);
}
