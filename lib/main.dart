import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/splash/splash_screen.dart';
import 'package:forme_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.customLightTheme,
        home: const SplashScreen(),
        onGenerateRoute: (settings) => generateRoute(settings, context),
      ),
    );
  }
}
