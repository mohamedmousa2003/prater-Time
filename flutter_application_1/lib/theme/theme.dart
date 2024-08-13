import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_colors.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
    textTheme: const TextTheme(
    bodyLarge: TextStyle(
    fontSize: 24,
    color: primary,
    fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
      color: white,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: white,
      fontSize: 14,
    )
  )
  );
}