/**
 * Objeto responsável por uma transação entre estados de um autômato.
 * Ela descreve uma ligação entre um estado de partida (from) e de chegada (to) através de um valor de gatilho (parameter).
 */
class Transaction {
  String _from = "";
  String _to = "";
  String _parameter = "";

  // Construtor
  Transaction(
      {required String from, required String to, required String parameter}) {
    this._from = from;
    this._to = to;
    this._parameter = parameter;
  }

  // Getters
  String get from => _from;
  String get to => _to;
  String get parameter => _parameter;
}
