import 'package:arvore_binaria/classes/classes.dart';

void main(List<String> arguments) {
  BinaryTree tree = BinaryTree(root: Node(value: 50));

  tree.insertNode(Node(value: 40), tree.getNode());
  tree.insertNode(Node(value: 45), tree.getNode());
  tree.insertNode(Node(value: 55), tree.getNode());
  tree.insertNode(Node(value: 47), tree.getNode());
  tree.insertNode(Node(value: 42), tree.getNode());

  tree.getDegree(45);
  tree.isExist(42);
}
