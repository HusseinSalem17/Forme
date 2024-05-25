import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class Themes {
  static final customLightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.white,
        color: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      
      brightness: Brightness.light,
      //primaryColor: AppColors.primaryColor,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      );
}
