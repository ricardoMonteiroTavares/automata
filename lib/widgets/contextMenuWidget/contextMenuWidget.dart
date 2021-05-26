import 'package:flutter/material.dart';

/// Objeto que renderiza o menu de contexto
class ContextMenuWidget {
  static final double height = 60;

  static Future<dynamic> show(
      {required BuildContext context,
      required Offset position,
      required List<PopupMenuEntry> items}) {
    assert(items.isNotEmpty, "Itens do Menu de Contexto não pode ser vazio");
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy,
          (position.dx + 30), (position.dy + (items.length * height))),
      items: items,
    );
  }
}
