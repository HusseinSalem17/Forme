import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/utils/check_box_bloc/checkbox_bloc.dart';

import '../features/Authentication/presentation/views/forgot_password_screen.dart';
import '../features/Authentication/presentation/views/new_password_screen.dart';
import '../features/Authentication/presentation/views/sign_in_screen.dart';
import '../features/Authentication/presentation/views/sign_up_screen.dart';
import '../features/Authentication/presentation/views/verify_code_screen.dart';
import '../features/trainee_features/preferences/presentation/views/preferences_screen.dart';
import '../onboarding_screens/views/onboarding_screen.dart';
import '../splash_screen.dart';

class AuthRoutes {
  MaterialPageRoute<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error: Route not found in auth route'),
        ),
      ),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case OnBoardingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CheckboxBloc(),
            child: const SignUpScreen(),
          ),
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case VerifyCodeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VerifyCodeScreen(),
        );
      case NewPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
      case PreferencesScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const PreferencesScreen(),
        );

      default:
        return _errorRoute();
    }
  }
}
