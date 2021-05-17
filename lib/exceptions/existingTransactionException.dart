/// Classe de exceção caso já exista uma transação em um autômato, seja ela idêntica ou
/// se tem o parâmetro da transação presente no estado de partida.
class ExistingTransactionException implements Exception {
  final String _msg = "Transação Existente";

  String get message => _msg;
}
