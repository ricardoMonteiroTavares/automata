/// Classe de exceção caso não exista o autômato
class NotFoundAutomataException implements Exception {
  final String _msg = "Autômato Inexistente";

  String get message => _msg;
}
