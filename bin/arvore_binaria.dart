import 'package:arvore_binaria/classes/classes.dart';

void main(List<String> arguments) {
  BinaryTree tree = BinaryTree(root: Node(value: 100));

  tree.insertNode(Node(value: 50), tree.getNode());
  tree.insertNode(Node(value: 110), tree.getNode());
  tree.insertNode(Node(value: 25), tree.getNode());
  tree.insertNode(Node(value: 105), tree.getNode());
  tree.insertNode(Node(value: 120), tree.getNode());
  tree.insertNode(Node(value: 103), tree.getNode());

  tree.isExist(50);

  print('');
  tree.inOrder(tree.getNode());
  print('');

  tree.deleteNode(100);
  print('');
  tree.inOrder(tree.getNode());
  print('');
  tree.isExist(100);
}
