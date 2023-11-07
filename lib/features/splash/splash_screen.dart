import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:forme_app/core/utils/image_assets.dart';
import 'package:forme_app/testScrean.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(AssetsImages.logo),
      ]),
      splashIconSize: 300,
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: const Duration(seconds: 1),
      curve: Curves.easeInOutBack,
      nextScreen: const TestScreen(),
    );
  }
}
