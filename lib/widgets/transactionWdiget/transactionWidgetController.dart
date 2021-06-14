import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'transactionWidgetController.g.dart';

class TransactionWidgetController = _TransactionWidgetController
    with _$TransactionWidgetController;

abstract class _TransactionWidgetController with Store {
  @observable
  Offset _initialPosition = Offset(0, 0);

  @observable
  Offset _finalPosition = Offset(0, 0);

  @action
  void setInitialPosition(Offset newInitialPosition) {
    _initialPosition = newInitialPosition;
  }

  @computed
  Offset get initialPosition => _initialPosition;

  @action
  void setFinalPosition(Offset newFinalPosition) {
    _finalPosition = newFinalPosition;
  }

  @computed
  Offset get finalPosition => _finalPosition;
}
