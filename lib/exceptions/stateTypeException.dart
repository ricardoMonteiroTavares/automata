/// Classe de exceção caso o valor do tipo de estado seja error
class StateTypeException implements Exception {
  final String _msg = "O novo tipo do estado não deve ser error";

  String get message => _msg;
}
