import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/sing_in_view.dart';
import 'package:forme_app/features/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- OnBoarding Routing -----
    // case OnBoardingView.routeName:
    //   return onBoardingRoute();

//----- Main Routing -----
    case '/':
      return splashRoute();

//Auth Routing
    case SignInScreen.routeName:
      return signInRoute();
    case SignUpScreen.routeName:
      return signUpRoute();
    case ForgetPasswordScreen.routeName:
      return forgotPasswordRoute();

//----- Verify Routing -----
    // case VerifyView.routeName:
    //   final List<dynamic> args = settings.arguments as List<dynamic>;
    //   final int verifyId = args[0] as int;
    //   final User user = args[1] as User;
    //   return verifyRoute(verifyId, user);

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

// MaterialPageRoute<dynamic> onBoardingRoute() {
//   return MaterialPageRoute(
//     builder: (context) => const OnBoardingView(),
//   );
// }

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


