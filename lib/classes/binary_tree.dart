// Copyright (c) 2021 Paulo Ricardo
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:arvore_binaria/classes/classes.dart';

import 'dart:math' as math;

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
        root.right!.father = root;
      } else {
        insertNode(newNode, root.right);
      }
    } else {
      if (root.left == null) {
        root.left = newNode;
        root.left!.father = root;
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

  void getHeight(int value) {
    getHeightRecursive(root, value);
  }

  void getHeightRecursive(Node? nodeFinder, int value) {
    if (nodeFinder != null) {
      if (nodeFinder.value == value) {
        print('A altura do nó $value é : ${heihtVerify(nodeFinder)}');
      } else if (value < nodeFinder.value) {
        getHeightRecursive(nodeFinder.left, value);
      } else if (value > nodeFinder.value) {
        getHeightRecursive(nodeFinder.right, value);
      }
    } else {
      print('O nó $value não existe na Árvore');
    }
  }

  int heihtVerify(Node? node) {
    if (node!.right == null && node.left == null) {
      return 0;
    } else if (node.right == null) {
      return heihtVerify(node.left) + 1;
    } else if (node.left == null) {
      return heihtVerify(node.right) + 1;
    } else {
      return math.max(heihtVerify(node.left), heihtVerify(node.right)) + 1;
    }
  }

  void getDepth(int value) {
    var depth = 0;
    getDepthRecursive(root, value, depth);
  }

  void getDepthRecursive(dynamic node, int value, int depth) {
    if (node == null || node.value == value) {
      if (node != null) {
        print('A profundidade do nó $value é : $depth');
      }
    }
    if (node != null) {
      if (node.value > value) {
        depth++;
        getDepthRecursive(node.left, value, depth);
      }
      depth++;
      getDepthRecursive(node.right, value, depth);
    }
  }
}
