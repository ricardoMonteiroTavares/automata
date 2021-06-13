import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/implementations/graphicAutomataManagerImpl.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

/// Classe responsável por manipular um autômato de forma gráfica
abstract class GraphicAutomataManager {
  factory GraphicAutomataManager() = GraphicAutomataManagerImpl;

  /// Adiciono um novo estado em uma determinada posição [position]
  void addState(Offset position);

  /// Crio uma nova transação a partir de uma determinada posição [startPosition]
  void newTransaction(Offset startPosition);

  /// Modifica a posição final de uma nova transação
  void updateFinalPositionNewTransaction(Offset finalPosition);

  /// Fim de posicionamento de uma nova Transação
  void finishFinalPosition();

  /// Busco o ID em uma determinada posição [position], caso não a encontre
  /// retornará a distância entre o clique e o nó mais próximo
  /// e caso tenha clicado em algum objeto do tipo [Pin], retornará a posição
  /// do centro do pin a fim de se criar uma nova transação.
  Options3<String, double, Offset> getState(Offset position);

  /// Guardo um estado selecionado [id]
  void selectState(String id);

  /// Removo o estado selecionado
  void unselectState();

  /// Verifico se existe um estado selecionado no manager
  bool get containsSelectState;

  /// Removo um estado selecionado
  void deleteState();

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  /// Comando que busca as posições dos objetos
  IDELayoutDelegate get positions;

  /// Busco o tipo do estado selecionado
  StateType get selectStateType;

  /// Busco a posição central do estado selecionado
  Offset get selectStatePosition;

  /// Modifico o tipo do estado selecionado
  set selectStateType(StateType newType);
}
