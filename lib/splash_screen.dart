import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:forme_app/core/utils/image_assets.dart';

class SplashScreen extends StatelessWidget {
  final bool isRegistered;

  const SplashScreen({super.key, this.isRegistered = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsImages.logo),
        ],
      ),
      splashIconSize: 300,
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
      nextScreen: isRegistered ? const SignInScreen() : const OnBoardingScreen(),
    );
  }
}
