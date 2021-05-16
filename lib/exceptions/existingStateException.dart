/// Classe de exceção caso já exista um estado em um autômato
class ExistingStateException implements Exception {
  final String _msg = "Estado Existente";

  String get message => _msg;
}
