import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code.dart';
//import 'package:forme_app/features/preferences_feature/presentation/views/preferencrs_screen.dart';
import 'package:forme_app/splash/splash_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';

import 'features/preferences_feature/presentation/views/preferences_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- Splash Routing -----
    case '/':
      return signInRoute();
      //splashRoute();

//----- OnBoarding Routing -----
    case OnBoardingView.routeName:
      return onBoardingRoute();

//----- Auth Routing ------
    case SignInScreen.routeName:
      return signInRoute();
    case SignUpScreen.routeName:
      return signUpRoute();
    case ForgetPasswordScreen.routeName:
      return forgotPasswordRoute();
    case VerifyCodeScreen.routeName:
      return verifyCodeRoute();
    case NewPasswordScreen.routeName:
      return newpasswordRoute();

//----- Preferences Routing -----
    case PreferencesScreen.routeName:
      return preferencesScreenRoute();

//----- Home Routing ------

    default:
      return notFound();
  }
}

MaterialPageRoute<dynamic> notFound() {
  return MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Scaffold(
        body: Text('This Page not found'),
      ),
    ),
  );
}

MaterialPageRoute<dynamic> splashRoute() {
  return MaterialPageRoute(
    builder: (context) => const SplashScreen(),
  );
}

MaterialPageRoute<dynamic> onBoardingRoute() {
  return MaterialPageRoute(
    builder: (context) => const OnBoardingView(),
  );
}

MaterialPageRoute<dynamic> signUpRoute() {
  return MaterialPageRoute(
    builder: (context) => const SignUpScreen(),
  );
}

MaterialPageRoute<dynamic> signInRoute() {
  return MaterialPageRoute(
    builder: (context) => const SignInScreen(),
  );
}

MaterialPageRoute<dynamic> forgotPasswordRoute() {
  return MaterialPageRoute(
    builder: (context) => const ForgetPasswordScreen(),
  );
}

MaterialPageRoute<dynamic> verifyCodeRoute() {
  return MaterialPageRoute(
    builder: (context) => const VerifyCodeScreen(),
  );
}

MaterialPageRoute<dynamic> newpasswordRoute() {
  return MaterialPageRoute(
    builder: (context) => const NewPasswordScreen(),
  );
}

MaterialPageRoute<dynamic> preferencesScreenRoute() {
  return MaterialPageRoute(
    builder: (context) =>  const PreferencesScreen(),
  );
}

// MaterialPageRoute<dynamic> homeRoute() {
//   return MaterialPageRoute(
//     builder: (context) => const HomeScreen(),
//   );
// }

// MaterialPageRoute<dynamic> verifyRoute(int verifyId, User user) {
//   return MaterialPageRoute(
//     builder: (context) => VerifyView(
//       verifyId: verifyId,
//       user: user,
//     ),
//   );
// }

//----- Verify Routing -----
// case VerifyView.routeName:
//   final List<dynamic> args = settings.arguments as List<dynamic>;
//   final int verifyId = args[0] as int;
//   final User user = args[1] as User;
//   return verifyRoute(verifyId, user);
