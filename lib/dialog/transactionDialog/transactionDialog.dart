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
          builder: (_) => Container(
            width: 350,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Informe o valor da transação",
                  style: TextStyle(
                      height: 1.5, fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Text(
                  (_controller.key == null) ? "Vazio" : _controller.key!,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(350, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: (_controller.key == null)
                        ? null
                        : () {
                            Navigator.of(context).pop(_controller.key);
                          },
                    child: Text(
                      "Fechar",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
