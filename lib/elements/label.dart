import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  late final String _label;

  Label({required String label}) {
    _label = label;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(
        _label,
        style: TextStyle(
          fontFamily: 'Courier New',
          color: Colors.grey[800],
          fontSize: 12,
        ),
      ),
    );
  }
}
