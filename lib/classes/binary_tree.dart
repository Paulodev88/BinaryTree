// Copyright (c) 2021 Paulo Ricardo
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'dart:io';

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

  int nivel = 0;

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

  void deleteNode(int value) {
    root = deleteRecursive(root, value)!;
  }

  Node? deleteRecursive(Node? node, int value) {
    if (node == null) {
      return node;
    }
    if (value < node.value) {
      node.left = deleteRecursive(node.left, value);
    } else if (value > node.value) {
      node.right = deleteRecursive(node.right, value);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.value = minValue(node.right);

      node.right = deleteRecursive(node.right, node.value);
    }

    return node;
  }

  int minValue(Node? node) {
    var minval = node!.value;

    while (node!.left != null) {
      minval = node.left!.value;
      node = node.left;
    }
    return minval;
  }

  ///Print node LNR
  void inOrder(Node? root) {
    if (root == null) {
      return;
    }
    inOrder(root.left);
    stdout.write(' ${root.value} ');
    inOrder(root.right);
  }

  ///Print node NLR
  void preOrder(Node? root) {
    if (root == null) {
      return;
    } else {
      stdout.write(' ${root.value} ');
      preOrder(root.left);
      preOrder(root.right);
    }
  }

  ///Print node LRN
  void postOrder(Node? root) {
    if (root == null) {
      return;
    }
    postOrder(root.left);
    postOrder(root.right);
    stdout.write(' ${root.value} ');
  }

  void isExist(int value) {
    isExistRecursive(root, value);
  }

  void isExistRecursive(Node? node, int value) {
    if (node != null) {
      if (node.value == value) {
        print('O n?? $value existe na ??rvore');
      } else if (value < node.value) {
        isExistRecursive(node.left, value);
      } else if (value > node.value) {
        isExistRecursive(node.right, value);
      }
    } else {
      print('O n?? $value n??o existe na ??rvore');
    }
  }

  void getNivel(int elemento) {
    var nivel = 0;
    nivelRecursive(root, elemento, nivel);
  }

  void nivelRecursive(dynamic no, int elemento, int nivel) {
    if (no == null || no.value == elemento) {
      if (no != null) {
        this.nivel = nivel;
      }
    }

    if (no != null) {
      if (no.value > elemento) {
        nivel++;
        nivelRecursive(no.left, elemento, nivel);
      }
      nivel++;
      nivelRecursive(no.right, elemento, nivel);
    }
  }

  void getDegree(int value) {
    getDegreeRecursive(root, value);
  }

  void getDegreeRecursive(Node? nodeFinder, int value) {
    if (nodeFinder != null) {
      if (nodeFinder.value == value) {
        if (nodeFinder.right == null && nodeFinder.left == null) {
          print('O grau do n?? $value ??: 0');
        } else if (nodeFinder.right != null && nodeFinder.left != null) {
          print('O grau do n?? $value ??: 2');
        } else {
          print('O grau do n?? $value ??: 1');
        }
      } else if (value < nodeFinder.value) {
        getDegreeRecursive(nodeFinder.left, value);
      } else if (value > nodeFinder.value) {
        getDegreeRecursive(nodeFinder.right, value);
      }
    } else {
      print('O n?? $value n??o existe na ??rvore');
    }
  }

  void getHeight(int value) {
    getHeightRecursive(root, value);
  }

  void getHeightRecursive(Node? nodeFinder, int value) {
    if (nodeFinder != null) {
      if (nodeFinder.value == value) {
        print('A altura do n?? $value ?? : ${heihtVerify(nodeFinder)}');
      } else if (value < nodeFinder.value) {
        getHeightRecursive(nodeFinder.left, value);
      } else if (value > nodeFinder.value) {
        getHeightRecursive(nodeFinder.right, value);
      }
    } else {
      print('O n?? $value n??o existe na ??rvore');
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
        print('A profundidade do n?? $value ?? : $depth');
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

  void getCount() {
    var count = getCountRecursive(root);
    print('A quantidade de n?? da ??rvore ?? : $count');
  }

  int getCountRecursive(Node? node) {
    if (node!.right == null && node.left == null) {
      return 1;
    } else if (node.right == null) {
      return getCountRecursive(node.left) + 1;
    } else if (node.left == null) {
      return getCountRecursive(node.right) + 1;
    } else {
      return getCountRecursive(node.left) + getCountRecursive(node.right) + 1;
    }
  }

  void reverseTree() {
    reverseTreeRecursive(root);
  }

  void reverseTreeRecursive(Node? node) {
    if (node!.right != null && node.left != null) {
      Node? newRight = node.left;
      node.left = node.right;
      node.right = newRight;
      reverseTreeRecursive(node.left);
      reverseTreeRecursive(node.right);
    } else if (node.left != null) {
      Node? newLeft = node.right;
      node.right = node.left;
      node.left = newLeft;
      reverseTreeRecursive(node.right);
    } else if (node.right != null) {
      Node? newRight = node.left;
      node.left = node.right;
      node.right = newRight;
      reverseTreeRecursive(node.left);
    }
  }

  void printTree(Node? node) {
    if (node == null) {
      return;
    }

    printTree(node.right);
    getNivel(node.value);
    for (var i = 0; i < nivel; i++) {
      stdout.write('\t');
    }
    stdout.write(' ${node.value}\n');

    printTree(node.left);
  }
}
