// Copyright (c) 2021 Paulo Ricardo
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'dart:io';

import 'package:arvore_binaria/classes/classes.dart';
import 'dart:math' as math;

class Controller {
  BinaryTree _root = BinaryTree(root: Node(value: 50));

  void randomCreate() {
    var rng = math.Random();
    for (int i = 0; i < 10; i++) {
      _root.insertNode(Node(value: rng.nextInt(100)), _root.getNode());
    }
  }

  void manualCreate() {
    print('Informe o valor da RAIZ da Árvore');

    bool success = true;
    try {
      int num = int.parse(stdin.readLineSync()!);
      _root = BinaryTree(root: Node(value: num));
    } catch (e) {
      print('Valor informado é inválido');
      success = false;
    }

    if (success) {
      insertNode();
    } else {
      print('Não foi possível gerar sua Árvore manual!');
      print('Algo deu errado =/');
    }
  }

  void insertNode() {
    int num;
    String op;
    print('Informe o nó que deseja inserir');
    do {
      try {
        num = int.parse(stdin.readLineSync()!);
        _root.insertNode(Node(value: num), _root.getNode());
        print('Nó $num inserido com sucesso na Árvore!\n');
      } catch (e) {
        print('Valor informado é inválido');
      }

      print('Deseja inserir mais elementos ? (Sim / Não)');

      op = stdin.readLineSync()!.toLowerCase();
    } while (op == 'sim' || op == 's');
  }

  void getGenerate() {
    var op = -1;
    do {
      print('\n         ::::   Arvóre Genérica   ::::\n');
      print('::         Escolha uma opção de 0 a 2         ::\n');
      print('::     1  - Gerar Árvore Manual               ::');
      print('::     2  - Gerar Árvore Automatica           ::');
      print('::     3  - Adicionar elemento na Árvore      ::');
      print('::     0  - Sair                              ::\n');

      try {
        op = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print('Inserio um valor invalido!');
      }

      switch (op) {
        case 1:
          manualCreate();
          break;
        case 2:
          randomCreate();
          break;
        case 3:
          insertNode();
          break;
        case 0:
          print('Saindo ...');
          break;
        default:
          print(
              'Valor inserido não consta no menu, favor inserir outro valor!');
          break;
      }
    } while (op != 0);
  }

  void getInOrder() {
    print('\nA árvore em In-Order é:');
    _root.inOrder(_root.getNode());
    print('\n');
  }

  void getPreOrder() {
    print('\nA árvore em Pre-Order é:');
    _root.preOrder(_root.getNode());
    print('\n');
  }

  void getPostOrder() {
    print('\nA árvore em Post-Order é:');
    _root.postOrder(_root.getNode());
    print('\n');
  }

  int insertNumber() {
    int num;
    try {
      num = int.parse(stdin.readLineSync()!);
      return num;
    } catch (e) {
      print('Valor informado é inválido');
      return -1;
    }
  }

  void getDegree() {
    print('\nInforme o valor do nó que deseja ver o grau :');
    _root.getDegree(insertNumber());
  }

  void getDepth() {
    print('\nInforme o valor do nó que deseja ver a profundidade :');
    _root.getDepth(insertNumber());
  }

  void getNivel() {
    print('\nInforme o valor do nó que deseja ver o nivel :');
    _root.getNivel(insertNumber());
    print('O nivel do do elemento é: ${_root.nivel}');
  }

  void getHeight() {
    print('\nInforme o valor do nó que deseja ver a altura :');
    _root.getHeight(insertNumber());
  }

  void getCount() {
    _root.getCount();
  }

  void getElement() {
    print('\nInforme o valor do nó que deseja buscar na árvore :');
    _root.isExist(insertNumber());
  }

  void removeNode() {
    print('\nInforme o valor do nó que deseja excluir da árvore :');
    _root.deleteNode(insertNumber());
  }

  void getReverse() {
    print('\nA árvore que vai ser invertida em Post-Order');
    _root.postOrder(_root.getNode());
    print('\nOs filhos da sua árvore foram invertidos!!');
    _root.reverseTree();
    print('\nA árvore invertida em Post-Order');
    _root.postOrder(_root.getNode());
  }

  void insertPosOrder() {
    List<String> nodes = [];
    List<int> nodesPosOrder = [];
    List<int> nodeReverse = [];
    print('Informe o nó que deseja inserir no percuso Pós Order');

    try {
      nodes = stdin.readLineSync()!.split(' ');
    } catch (e) {
      print('Valor informado é inválido');
    }

    for (var elements in nodes) {
      nodesPosOrder.add(int.parse(elements));
    }

    nodeReverse = nodesPosOrder.reversed.toList();
    for (var i = 0; i < nodesPosOrder.length; i++) {
      if (i == 0) {
        _root = BinaryTree(root: Node(value: nodeReverse[0]));
      } else {
        _root.insertNode(Node(value: nodeReverse[i]), _root.getNode());
      }
    }
  }

  void insertPreOrder() {
    List<String> nodes = [];
    List<int> nodesPreOrder = [];
    print('Informe o nó que deseja inserir no percuso Pre Order');

    try {
      nodes = stdin.readLineSync()!.split(' ');
    } catch (e) {
      print('Valor informado é inválido');
    }

    for (var elements in nodes) {
      nodesPreOrder.add(int.parse(elements));
    }

    for (var i = 0; i < nodesPreOrder.length; i++) {
      if (i == 0) {
        _root = BinaryTree(root: Node(value: nodesPreOrder[0]));
      } else {
        _root.insertNode(Node(value: nodesPreOrder[i]), _root.getNode());
      }
    }
  }

  void insertInOrder() {
    List<String> nodes = [];
    List<int> nodeReverse = [];
    print('Informe o nó que deseja inserir no percuso In Order');

    try {
      nodes = stdin.readLineSync()!.split(' ');
    } catch (e) {
      print('Valor informado é inválido');
    }

    for (var elements in nodes) {
      nodeReverse.add(int.parse(elements));
    }

    nodeReverse.shuffle();

    for (var i = 0; i < nodes.length; i++) {
      if (i == 0) {
        _root = BinaryTree(root: Node(value: nodeReverse[0]));
      } else {
        _root.insertNode(Node(value: nodeReverse[i]), _root.getNode());
      }
    }
  }

  void imprimirTree() {
    print('Arvore Binaria de Busca:: ');
    _root.printTree(_root.getNode());
  }
}
