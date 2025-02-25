import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/theme/color_palette.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isNext;
  final String text;
  final Function() onTap;
  final IconData? icon;
  final AssetImage? iconImage;

  const CustomElevatedButton(
      {super.key,
      this.isNext = true,
      required this.text,
      required this.onTap,
      this.icon,
    this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isNext
                ? ColorPalette.primaryColor
                : ColorPalette.scaffoldBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            side: BorderSide(
              color: ColorPalette.primaryColor,
            )),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            if (iconImage != null) ImageIcon(iconImage),
            Text(
              text,
              style: TextStyle(
                  color: isNext
                      ? ColorPalette.scaffoldBackground
                      : ColorPalette.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ).setVerticalPadding(context, 0.015),
          ],
        ));
  }
}
