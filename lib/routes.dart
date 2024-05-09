import 'package:flutter/material.dart';

import 'package:forme_app/features/Authentication/presentation/views/new_password_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code_screen.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/Transformations_screen.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/screens/add_transformation.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/add_workout.dart';

import 'package:forme_app/features/trainer_features/dashboard/presentation/views/home_view.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/my_services_screen.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/subscriptions_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';

import 'package:forme_app/features/trainee_features/payment/presentation/view/payment_successfully_screen.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/complete_profile.dart';

import 'package:forme_app/splash_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';
import 'features/authentication/presentation/views/forgot_password_screen.dart';
import 'features/authentication/presentation/views/sign_in_screen.dart';
import 'features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import 'features/trainer_features/Trainee_profile/presentation/views/trainee_profile_screen.dart';
import 'features/trainer_features/Trainer_Notification/presentation/views/trainer_notification_screen.dart';
import 'features/trainer_features/Trainer_Profile/presentation/views/trainer_profile_screen.dart';
import 'features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import 'features/trainer_features/client_list/presentation/views/client_list_screen.dart';
import 'features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'features/trainer_features/create_sessions/presentation/views/create_session.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- Splash Routing -----
    case '/':
      return signInRoute();
    // trainerProfileScreenRoute();
    // favoriteScreenRoute();
    // homeRoute();
    //splashRoute();

//----- OnBoarding Routing -----
    case OnBoardingScreen.routeName: //done
      return onBoardingRoute();

//----- Auth Routing ------
    case SignInScreen.routeName: //done
      return signInRoute();
    case SignUpScreen.routeName: //done
      return signUpRoute();
    case ForgotPasswordScreen.routeName: //done
      return forgotPasswordRoute();
    case VerifyCodeScreen.routeName: //done
      return verifyCodeRoute();
    case NewPasswordScreen.routeName://done
      return newPasswordRoute();
//------------------------------------------- user section ------------------------
//////////////// REMOVED //////////////////

//------------------------------------------- trainer section -----------------------
//-------- Home Routing -----------
    case TrainerHomeScreen.routeName: // done
      return trainerHomeRoute();
//-------- Preferences Routing -----------
    case TrainerPreferenceScreen.routeName: // done
      return trainerPreferencesScreenRoute();
//-------- Complete Profile Routing -----------
    case TrainerCompleteProfile.routeName: // done
      return trainerCompleteProfileRoute();
//-------- My Services Routing -----------
    case MyServicesScreen.routeName: // done

      return trainerMyServicesScreen();
//-------- Add Program Routing -----------
    case AddProgramScreen.routeName: // done
      return addProgramRoute();
//-------- Revenue Routing -----------
    case RevenueScreen.routeName: // done
      return revenueScreenRoute();
//-------- Client list Routing -----------
    case ClientListScreen.routeName: // done
      return trainerClientListScreen();
//-------- Create Session Routing -----------
    case CreateSessionScreen.routeName: // done
      return createSessionRoute();
//-------- Subscriptions Routing -----------
    case SubscriptionsScreen.routeName: // done
      return subscriptionsScreenRoute();
//-------- Notification Routing -----------
    case TrainerNotificationScreen.routeName: // done
      return trainerNotificationScreenRoute();
//-------- Trainee Profile Routing -----------
    case TraineeProfileScreen.routeName: // done
      return traineeProfileScreenRoute();
//-------- Trainer Profile Routing -----------
    case TrainerProfileScreen.routeName: // done
      return trainerProfileScreenRoute();
//-------- Transformations Routing -----------
    case TransformationsScreen.routeName: //done
      return transformationRoute();
    case AddTransformation.routeName: //done
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final String title = args[0] as String;
      return addTransformationRoute(
        title,
      );
    case AddWorkoutScreen.routeName: // done
      return addWorkoutRoute();
//---------------------------------------
    default:
      return notFound();
  }
}

MaterialPageRoute<dynamic> completeProfile() {
  return MaterialPageRoute(
    builder: (context) => const CompleteProfile(),
  );
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
    builder: (context) => const OnBoardingScreen(),
  );
}

MaterialPageRoute<dynamic> signUpRoute() {
  return MaterialPageRoute(
    builder: (context) => const SignUpScreen(),
  );
}

MaterialPageRoute<dynamic> signInRoute() {
  return MaterialPageRoute(
    builder: (context) => SignInScreen(),
  );
}

MaterialPageRoute<dynamic> forgotPasswordRoute() {
  return MaterialPageRoute(
    builder: (context) => const ForgotPasswordScreen(),
  );
}

MaterialPageRoute<dynamic> verifyCodeRoute() {
  return MaterialPageRoute(
    builder: (context) => const VerifyCodeScreen(),
  );
}

MaterialPageRoute<dynamic> newPasswordRoute() {
  return MaterialPageRoute(
    builder: (context) => const NewPasswordScreen(),
  );
}

MaterialPageRoute<dynamic> preferencesScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const PaymentSuccessfullyScreen(),
  );
}

//---------------- trainer section --------------

MaterialPageRoute<dynamic> trainerHomeRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerHomeScreen(),
  );
}

MaterialPageRoute<dynamic> trainerPreferencesScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerPreferenceScreen(),
  );
}

MaterialPageRoute<dynamic> trainerCompleteProfileRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerCompleteProfile(),
  );
}

MaterialPageRoute<dynamic> trainerMyServicesScreen() {
  return MaterialPageRoute(
    builder: (context) => const MyServicesScreen(),
  );
}

MaterialPageRoute<dynamic> addProgramRoute() {
  return MaterialPageRoute(
    builder: (context) => const AddProgramScreen(),
  );
}

MaterialPageRoute<dynamic> revenueScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const RevenueScreen(),
  );
}

MaterialPageRoute<dynamic> trainerClientListScreen() {
  return MaterialPageRoute(
    builder: (context) => const ClientListScreen(),
  );
}

MaterialPageRoute<dynamic> createSessionRoute() {
  return MaterialPageRoute(
    builder: (context) => const CreateSessionScreen(),
  );
}

MaterialPageRoute<dynamic> subscriptionsScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const SubscriptionsScreen(),
  );
}

MaterialPageRoute<dynamic> trainerNotificationScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerNotificationScreen(),
  );
}

MaterialPageRoute<dynamic> traineeProfileScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const TraineeProfileScreen(),
  );
}

MaterialPageRoute<dynamic> trainerProfileScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerProfileScreen(),
  );
}

MaterialPageRoute<dynamic> transformationRoute() {
  return MaterialPageRoute(
    builder: (context) => const TransformationsScreen(),
  );
}

MaterialPageRoute<dynamic> addTransformationRoute(String title) {
  return MaterialPageRoute(
    builder: (context) => AddTransformation(
      title: title,
    ),
  );
}

MaterialPageRoute<dynamic> addWorkoutRoute() {
  return MaterialPageRoute(
    builder: (context) => const AddWorkoutScreen(),
  );
}
