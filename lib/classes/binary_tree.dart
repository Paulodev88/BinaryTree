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
}
