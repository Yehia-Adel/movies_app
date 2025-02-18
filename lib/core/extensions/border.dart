import 'package:flutter/cupertino.dart';

extension BorderOnWidget on Widget {
  Widget serBorder(Color color) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: this,
    );
  }
}
