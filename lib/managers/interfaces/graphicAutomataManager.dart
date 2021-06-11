import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/implementations/graphicAutomataManagerImpl.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

/// Classe responsável por manipular um autômato de forma gráfica
abstract class GraphicAutomataManager {
  factory GraphicAutomataManager() = GraphicAutomataManagerImpl;

  /// Adiciono um novo estado em uma determinada posição [position]
  void addState(Offset position);

  /// Adiciono uma nova transação
  void addTransaction(TransactionWidget transaction);

  /// Gero um id único para a nova transação
  String get uniqueTransactionID;

  /// Busco o ID em uma determinada posição [position], caso não a encontre
  /// retornará um par com a distância entre o clique e o nó mais próximo
  /// e o id do nó mais próximo.
  Either<String, Pair<String, double>> getState(Offset position);

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
