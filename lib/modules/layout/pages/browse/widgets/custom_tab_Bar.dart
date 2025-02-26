import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_palette.dart';

class CustomTabBar extends StatelessWidget {
  final String tabTitle;
  final bool isSelected;
  final Function() ontap;

  const CustomTabBar({
    super.key,
    required this.tabTitle,
    required this.isSelected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? ColorPalette.primaryColor
            : ColorPalette.scaffoldBackground,
        side: BorderSide(color: ColorPalette.primaryColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        tabTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: isSelected
              ? ColorPalette.scaffoldBackground
              : ColorPalette.primaryColor,
        ),
      ),
    );
  }
}

