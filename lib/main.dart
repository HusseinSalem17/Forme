import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/splash/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.customLightTheme,
      home: const SplashScreen()
    );
  }
}
