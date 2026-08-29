import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF120B1F);
  static const appBar = Color(0xFF1F1235);
  static const cardDark = Color(0xFF1F1235);
  static const cardMedium = Color(0xFF2A1B4A);
  static const neonPink = Color(0xFFFF2E9A);
  static const neonCyan = Colors.cyanAccent;
}

ThemeData buildAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.neonPink,
      brightness: Brightness.dark,
    ),
  );
}
