/// Classe de exceção caso não exista um estado final no autômato
class NotFoundFinalStateException implements Exception {
  final String _msg = "Estado Final Inexistente";

  String get message => _msg;
}
