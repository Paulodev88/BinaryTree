import 'dart:io';

void main(List<String> arguments) {
  var choice = -1;

  do {
    print('\n         ::::   Arvóre Genérica   ::::\n');
    print('::         Escolha uma opção de 0 a 12        ::\n');
    print('::     1  - Gerar Árvore                      ::');
    print('::     2  - Imprimir Árvore Pós-Ordem LRN     ::');
    print('::     3  - Imprimir Árvore Pré-Ordem NLR     ::');
    print('::     4  - Imprimir Árvore In-Ordem  LNR     ::');
    print('::     5  - Imprimir o Grau                   ::');
    print('::     6  - Imprimir a Profundidade           ::');
    print('::     7  - Imprimir os Níveis                ::');
    print('::     8  - Imprimir Altura                   ::');
    print('::     9  - Imprimir quantidade de Nó         ::');
    print('::     10 - Verificar Elemento                ::');
    print('::     11 - Remover um Elemento               ::');
    print('::     12 - Reveter Árvore                    ::');
    print('::     0  - Finalizar Programa                ::\n');

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('A Escolha é um valor inválido!');
    }

    switch (choice) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
      case 11:
        break;
      case 12:
        break;
      default:
        print('Valor digitado não consta no menu, favor digitar outro valor');
        break;
    }
  } while (choice != 0);
}
