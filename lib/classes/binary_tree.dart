// Copyright (c) 2021 Paulo Ricardo
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:arvore_binaria/classes/classes.dart';

class BinaryTree {
  Node root;
  BinaryTree({
    required this.root,
  });

  Node getNode() {
    return root;
  }

  void insertNode(Node newNode, Node? root) {
    if (newNode.value > root!.value) {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertNode(newNode, root.right);
      }
    } else {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertNode(newNode, root.left);
      }
    }
  }

  ///Print node LNR
  void inOrder(Node? root) {
    if (root == null) {
      return;
    }
    inOrder(root.left);
    print(' ${root.value} ');
    inOrder(root.right);
  }

  ///Print node NLD
  void preOrder(Node? root) {
    if (root == null) {
      return;
    } else {
      print(' ${root.value} ');
      preOrder(root.left);
      preOrder(root.right);
    }
  }

  ///Print node LRN
  void posOrder(Node? root) {
    if (root == null) {
      return;
    }
    posOrder(root.left);
    posOrder(root.right);
    print(' ${root.value} ');
  }

  void isExist(int value) {
    isExistRecursive(root, value);
  }

  void isExistRecursive(Node? node, int value) {
    if (node != null) {
      if (node.value == value) {
        print('O nó $value existe na Árvore');
      } else if (value < node.value) {
        isExistRecursive(node.left, value);
      } else if (value > node.value) {
        isExistRecursive(node.right, value);
      }
    } else {
      print('O nó $value não existe na Árvore');
    }
  }

  void getDegree(int value) {
    getDegreeRecursive(root, value);
  }

  void getDegreeRecursive(Node? nodeFinder, int value) {
    if (nodeFinder != null) {
      if (nodeFinder.value == value) {
        if (nodeFinder.right == null && nodeFinder.left == null) {
          print('O grau do nó $value é: 0');
        } else if (nodeFinder.right != null && nodeFinder.left != null) {
          print('O grau do nó $value é: 2');
        } else {
          print('O grau do nó $value é: 1');
        }
      } else if (value < nodeFinder.value) {
        getDegreeRecursive(nodeFinder.left, value);
      } else if (value > nodeFinder.value) {
        getDegreeRecursive(nodeFinder.right, value);
      }
    } else {
      print('O nó $value não existe na Árvore');
    }
  }
}
