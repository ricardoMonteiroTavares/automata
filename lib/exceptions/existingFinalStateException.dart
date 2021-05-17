/// Classe de exceção caso já exista o estado final no autômato
class ExistingFinalStateException implements Exception {
  final String _msg = "Estado final já existe";

  String get message => _msg;
}
