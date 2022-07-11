import 'package:flutter/material.dart';

class AppColors {
  static const green = Color.fromARGB(255, 53, 155, 144);
  static final grey = Colors.grey[800];
}

final theme = ThemeData(
  backgroundColor: Colors.white,
  primaryColor: AppColors.green,
  colorScheme: const ColorScheme.light(
    primary: AppColors.green,
    secondary: AppColors.green,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.green,
  ),
);
