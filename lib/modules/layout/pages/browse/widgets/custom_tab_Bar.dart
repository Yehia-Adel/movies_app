import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_palette.dart';

class CustomTabBar extends StatelessWidget {
  final String tabTitle;
  final bool isSelected;

  const CustomTabBar(
      {super.key, required this.tabTitle, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: ColorPalette.primaryColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Text(
          tabTitle,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: isSelected
                  ? ColorPalette.scaffoldBackground
                  : ColorPalette.primaryColor),
        ));
  }
}
