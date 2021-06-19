import 'package:automata/dialog/transactionDialog/transactionDialogController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionDialog extends StatelessWidget {
  TransactionDialog({Key? key}) : super(key: key);

  final TransactionDialogController _controller = TransactionDialogController();

  final FocusNode _node = FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_node);
    return RawKeyboardListener(
      focusNode: _node,
      autofocus: true,
      onKey: _controller.keyPressed,
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Observer(
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Informe o valor da transação",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                (_controller.key == null) ? "" : _controller.key!,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(_controller.key);
                    },
                    child: Text(
                      "Fechar",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
