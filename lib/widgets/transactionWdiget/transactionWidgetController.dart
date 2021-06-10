import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'transactionWidgetController.g.dart';

class TransactionWidgetController = _TransactionWidgetController
    with _$TransactionWidgetController;

abstract class _TransactionWidgetController with Store {
  @observable
  Offset _initialPosition = Offset(0, 0);

  @observable
  Offset _distance = Offset(0, 0);

  @action
  void setInitialPosition(Offset newInitialPosition) {
    _initialPosition = newInitialPosition;
  }

  @computed
  Offset get initialPosition => _initialPosition;

  @action
  void setDistance(Offset newDistance) {
    _distance = newDistance;
  }

  @computed
  Offset get distance => _distance;
}
