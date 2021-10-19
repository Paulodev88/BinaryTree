import 'dart:io';

import 'package:arvore_binaria/core/core.dart';

void main(List<String> arguments) {
  var choice = -1;
  Controller controller = Controller();

  do {
    print('\n         ::::   Arvóre Genérica   ::::\n');
    print('::         Escolha uma opção de 0 a 12        ::\n');
    print('::     1  - Gerar Árvore                      ::');
    print('::     2  - Gerar Árvore Pós-Ordem LRN     ::');
    print('::     3  - Gerar Árvore Pré-Ordem NLR     ::');
    print('::     4  - Gerar Árvore In-Ordem  LNR     ::');
    print('::     5  - Imprimir Árvore Pós-Ordem LRN     ::');
    print('::     6  - Imprimir Árvore Pré-Ordem NLR     ::');
    print('::     7  - Imprimir Árvore In-Ordem  LNR     ::');
    print('::     8  - Imprimir o Grau                   ::');
    print('::     9  - Imprimir a Profundidade           ::');
    print('::     10 - Imprimir os Níveis                ::');
    print('::     11 - Imprimir Altura                   ::');
    print('::     12 - Imprimir quantidade de Nó         ::');
    print('::     13 - Verificar Elemento                ::');
    print('::     14 - Remover um Elemento               ::');
    print('::     15 - Reveter Árvore                    ::');
    print('::     0  - Finalizar Programa                ::\n');

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('A Escolha é um valor inválido!');
    }

    switch (choice) {
      case 1:
        controller.getGenerate();
        break;
      case 2:
        controller.insertPosOrder();
        break;
      case 3:
        controller.insertPreOrder();
        break;
      case 4:
        controller.insertInOrder();
        break;
      case 5:
        controller.getPostOrder();
        break;
      case 6:
        controller.getPreOrder();
        break;
      case 7:
        controller.getInOrder();
        break;
      case 8:
        controller.getDegree();
        break;
      case 9:
        controller.getDepth();
        break;
      case 10:
        controller.getNivel();
        break;
      case 11:
        controller.getHeight();
        break;
      case 12:
        controller.getCount();
        break;
      case 13:
        controller.getElement();
        break;
      case 14:
        controller.removeNode();
        break;
      case 15:
        controller.getReverse();
        break;
      case 16:
        controller.imprimirTree();
        break;
      case 0:
        print('Saindo ....');
        break;
      default:
        print('Valor digitado não consta no menu, favor digitar outro valor');
        break;
    }
  } while (choice != 0);
}
