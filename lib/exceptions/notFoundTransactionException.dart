/// Classe de exceção caso não exista uma determinada transação em um autômato
class NotFoundTransactionException implements Exception {
  final String _msg = "Transação Inexistente";

  String get message => _msg;
}
