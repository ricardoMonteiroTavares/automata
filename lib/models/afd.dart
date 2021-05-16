class AFD {
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
}
