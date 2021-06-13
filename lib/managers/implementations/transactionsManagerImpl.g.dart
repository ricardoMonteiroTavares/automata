// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionsManagerImpl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsManagerImpl on _TransactionsManagerImpl, Store {
  Computed<String>? _$uniqueTransactionIDComputed;

  @override
  String get uniqueTransactionID => (_$uniqueTransactionIDComputed ??=
          Computed<String>(() => super.uniqueTransactionID,
              name: '_TransactionsManagerImpl.uniqueTransactionID'))
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

  final _$_TransactionsManagerImplActionController =
      ActionController(name: '_TransactionsManagerImpl');

  @override
  void createNewTransaction(Offset pos) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.createNewTransaction');
    try {
      return super.createNewTransaction(pos);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalPositionNewTransaction(Offset finalPosition) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.updateFinalPositionNewTransaction');
    try {
      return super.updateFinalPositionNewTransaction(finalPosition);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishFinalPosition() {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.finishFinalPosition');
    try {
      return super.finishFinalPosition();
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTransaction(String id) {
    final _$actionInfo = _$_TransactionsManagerImplActionController.startAction(
        name: '_TransactionsManagerImpl.deleteTransaction');
    try {
      return super.deleteTransaction(id);
    } finally {
      _$_TransactionsManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uniqueTransactionID: ${uniqueTransactionID},
objects: ${objects},
transactions: ${transactions}
    ''';
  }
}
