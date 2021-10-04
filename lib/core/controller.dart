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
    print('\nA árvore em Pre-Order é:');
    _root.postOrder(_root.getNode());
    print('\n');
  }
}
