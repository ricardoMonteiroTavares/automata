import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:automata/managers/implementations/graphicAutomataManagerImpl.dart';
import 'package:flutter/widgets.dart';

/// Classe responsável por manipular um autômato de forma gráfica
abstract class GraphicAutomataManager {
  factory GraphicAutomataManager() = GraphicAutomataManagerImpl;

  /// Adiciono um novo estado em uma determinada posição [position]
  void addState(Offset position);

  /// Busco o ID em uma determinada posição [position]
  String getState(Offset position);

  /// Guardo um estado selecionado [state]
  void selectState(StateWidgetState state);

  /// Removo o estado selecionado
  void unselectState();

  bool get containsSelectState;

  /// Removo um estado selecionado
  void deleteState();

  /// Modifico a posição de um determinado estado [id] para uma nova posição [newPosition]
  void setPositionState(String id, Offset newPosition);

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  /// Comando que busca as posições dos objetos
  IDELayoutDelegate get positions;
}
