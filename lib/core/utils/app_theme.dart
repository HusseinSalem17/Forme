import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class Themes {
  static final customLightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white,
      color: AppColors.background,
    ),
    scaffoldBackgroundColor: AppColors.background,
  );
}
