// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionsManagerImpl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsManagerImpl on _TransactionsManagerImpl, Store {
  Computed<Transaction>? _$modelComputed;

  @override
  Transaction get model =>
      (_$modelComputed ??= Computed<Transaction>(() => super.model,
              name: '_TransactionsManagerImpl.model'))
          .value;
  Computed<String>? _$uniqueIDComputed;

  @override
  String get uniqueID =>
      (_$uniqueIDComputed ??= Computed<String>(() => super.uniqueID,
              name: '_TransactionsManagerImpl.uniqueID'))
          .value;
  Computed<List<LayoutId>>? _$objectsComputed;

  @override
  List<LayoutId> get objects =>
      (_$objectsComputed ??= Computed<List<LayoutId>>(() => super.objects,
              name: '_TransactionsManagerImpl.objects'))
          .value;
  Computed<Map<String, TransactionWidget>>? _$transactionsComputed;

  @override
  Map<String, TransactionWidget> get transactions => (_$transactionsComputed ??=
          Computed<Map<String, TransactionWidget>>(() => super.transactions,
              name: '_TransactionsManagerImpl.transactions'))
      .value;
  Computed<Offset>? _$finalPositionNewTransactionComputed;

  @override
  Offset get finalPositionNewTransaction =>
      (_$finalPositionNewTransactionComputed ??= Computed<Offset>(
              () => super.finalPositionNewTransaction,
              name: '_TransactionsManagerImpl.finalPositionNewTransaction'))
          .value;

  final _$_transactionsAtom =
      Atom(name: '_TransactionsManagerImpl._transactions');

  @override
  ObservableMap<String, TransactionWidget> get _transactions {
    _$_transactionsAtom.reportRead();
    return super._transactions;
  }

  @override
  set _transactions(ObservableMap<String, TransactionWidget> value) {
    _$_transactionsAtom.reportWrite(value, super._transactions, () {
      super._transactions = value;
    });
  }

  final _$_newTransactionAtom =
      Atom(name: '_TransactionsManagerImpl._newTransaction');

  @override
  TransactionWidget? get _newTransaction {
    _$_newTransactionAtom.reportRead();
    return super._newTransaction;
  }

  @override
  set _newTransaction(TransactionWidget? value) {
    _$_newTransactionAtom.reportWrite(value, super._newTransaction, () {
      super._newTransaction = value;
    });
  }

  final _$_selectedAtom = Atom(name: '_TransactionsManagerImpl._selected');

  @override
  TransactionWidget? get _selected {
    _$_selectedAtom.reportRead();
    return super._selected;
  }

  @override
  set _selected(TransactionWidget? value) {
    _$_selectedAtom.reportWrite(value, super._selected, () {
      super._selected = value;
    });
  }

  final _$_TransactionsManagerImplActionController =
      ActionController(name: '_TransactionsManagerImpl');

  @override
  void create(Pair<String, Offset> pos) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.create');
    try {
      return super.create(pos);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalPosition(Pair<String, Offset> finalPosition) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.updateFinalPosition');
    try {
      return super.updateFinalPosition(finalPosition);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  Options3<String, double, Null> getTransaction(Offset pos) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.getTransaction');
    try {
      return super.getTransaction(pos);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishCreate() {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.finishCreate');
    try {
      return super.finishCreate();
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(String? id) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.delete');
    try {
      return super.delete(id);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void select(String id) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.select');
    try {
      return super.select(id);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect() {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.unselect');
    try {
      return super.unselect();
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
uniqueID: ${uniqueID},
objects: ${objects},
transactions: ${transactions},
finalPositionNewTransaction: ${finalPositionNewTransaction}
    ''';
  }
}
