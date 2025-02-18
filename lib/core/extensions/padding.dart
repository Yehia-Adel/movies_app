import 'package:flutter/cupertino.dart';

extension PaddingToWidget on Widget {
  Widget setHorizontalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: enableMediaQuery ? mediaQuery * value : value),
      child: this,
    );
  }

  Widget setVerticalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: enableMediaQuery ? mediaQuery * value : value),
      child: this,
    );
  }
}
