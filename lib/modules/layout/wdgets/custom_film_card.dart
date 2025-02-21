import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_palette.dart';

class CustomFilmCard extends StatelessWidget {
  final String filmImage;
  final String filmRate;
  final double imageWidth;
  final double imageHeight;

  const CustomFilmCard(
      {super.key,
      required this.filmImage,
      required this.filmRate,
      required this.imageWidth,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(filmImage), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ColorPalette.generalGreyColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                filmRate,
                style: TextStyle(color: ColorPalette.white, fontSize: 10),
              ),
              Icon(
                Icons.star,
                color: ColorPalette.primaryColor,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
