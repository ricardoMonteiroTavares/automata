import 'package:automata/enums/stateType.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/widgets.dart';

import 'package:automata/managers/implementations/statesManagerImpl.dart';

abstract class StatesManager {
  factory StatesManager() = StatesManagerImpl;

  /// Adiciono um novo estado em uma determinada posição [position]
  ///  e retorno o ID do novo estado
  String add(Offset position);

  /// Removo um estado selecionado
  void delete(String id);

  /// Busco o ID em uma determinada posição [position], caso não a encontre
  /// retornará a distância entre o clique e o nó mais próximo
  /// e caso tenha clicado em algum objeto do tipo [Pin], retornará um par
  /// com o ID e posição do centro do pin a fim de se criar uma nova transação.
  Options3<String, double, Pair<String, Offset>> getState(Offset position);

  /// Guardo um estado selecionado [id]
  void select(String id);

  /// Removo o estado selecionado
  void unselect();

  /// Verifico se existe um estado selecionado no manager, se for positivo
  /// retorno o id, caso negativo, retorna null.
  String? get selected;

  /// Busco a posição central do estado selecionado
  Offset get selectStatePosition;

  /// Busco o tipo do estado selecionado
  StateType get selectStateType;

  /// Modifico o tipo do estado informado [id]
  void setStateType(String id, StateType newType);

  String get newUniqueID;

  int get len;

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  Map<String, StateWidget> get states;
}
