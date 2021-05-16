/// Classe de exceção caso já exista uma transação em um autômato
class ExistingTransactionException implements Exception {
  final String _msg = "Transação Existente";

  String get message => _msg;
}
