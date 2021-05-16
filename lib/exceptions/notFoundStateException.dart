/// Classe de exceção caso não exista um estado em um autômato
class NotFoundStateException implements Exception {
  final String _msg = "Estado Inexistente";

  String get message => _msg;
}
