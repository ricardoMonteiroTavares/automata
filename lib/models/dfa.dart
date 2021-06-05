/// Objeto que representa um Autômato Finito Determinístico (DFA).
///
/// Definição:
/// Um Autômato Finito Determinístico A é uma 5-tuple (ou quíntupla), (Q, Σ, δ, q0, F) consistindo de:

///    - um conjunto finito de símbolos de entrada chamado Alfabeto (Σ)
///    - um conjunto finito de estados (Q)
///    - uma função de transição (δ : Q × Σ → Q)
///    - um estado inicial (q0 ∈ Q) e
///    - um conjunto de estados de aceitação (F ⊆ Q)
class DFA extends Object {
  List<String> _q = [];
  List<String> _sigma = [];
  String _q0 = "";
  List<String> _f = [];
  Map<String, Map<String, String>> _delta = {};

  // Getters
  List<String> get states => _q;

  String get initialState => _q0;

  List<String> get transactions => _sigma;

  List<String> get finalStates => _f;

  Map<String, Map<String, String>> get tableTransactions => _delta;

  // Setters
  set states(List<String> states) => {_q = states};

  set initialState(String initialState) => {_q0 = initialState};

  set transactions(List<String> transactions) => {_sigma = transactions};

  set finalStates(List<String> finalStates) => {_f = finalStates};

  set tableTransactions(Map<String, Map<String, String>> table) =>
      {_delta = table};

  // Getters
  @override
  String toString() =>
      "Estados: ${_q.toString()}\nEstado Inicial: $_q0\nEstados Finais: ${_f.toString()}\nTransações: ${_delta.toString()}";
}
