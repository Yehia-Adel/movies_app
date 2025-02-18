import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_palette.dart';

class AppThemeManager {
  static ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
      appBarTheme: AppBarTheme(
          color: ColorPalette.scaffoldBackground, centerTitle: true));
}
