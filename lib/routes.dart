import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code.dart';
import 'package:forme_app/features/Payment/presentation/view/ereceipt_screen.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/success_story.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/trainer_details_view.dart';
import 'package:forme_app/features/home/presentation/views/home_view.dart';
import 'package:forme_app/features/payment/presentation/view/congratulation_screen.dart';
import 'package:forme_app/features/reviews/presentation/views/add_review.dart';
import 'package:forme_app/features/reviews/presentation/views/workout_review.dart';
import 'package:forme_app/features/sports_club/presentation/views/sports_club.dart';
import 'package:forme_app/splash_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';

import 'features/join_program_feature/presentation/views/add_new_card_screen.dart';
import 'features/join_program_feature/presentation/views/book_onling_coach_screen.dart';
import 'features/Complete_profile/presentation/views/complete_profile.dart';
import 'features/join_program_feature/presentation/views/payment_methods_screen.dart';
import 'features/join_program_feature/presentation/views/review_summary.dart';
import 'features/preferences/presentation/views/preferences_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- Splash Routing -----
    case '/':
      return sportsClubRoute();
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

//--------------- Home Routing ----------------
    case HomeScreen.routeName:
      return homeRoute();
//---- Trainer Details Routing ----
    case TrainerDetailsScreen.routeName:
      return trainerDetailsRoute();

    case SuccessStory.routeName:
      return successStoryRoute();

//----- Complete Profile Routing -----
    case CompleteProfile.routeName:
      return completeProfile();
//---- Review Routing ----
    case AddReview.routeName:
      return addReviewRoute();
    case WorkoutReview.routeName:
      return workoutReviewRoute();
//---- payment Routing ----
    case CongratulationScreen.routeName:
      return congratulationRoute();
    case EReceiptScreen.routeName:
      return eReceiptRoute();
//---- sports club Routing ----
    case SportsClubScreen.routeName:
      return sportsClubRoute();
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
    //builder: (context) => const BookOnlineCoachScreen(),
    //builder: (context) => const PaymentMethodsScreen(),
    builder: (context) => const ReviewSummary(),
  );
}

MaterialPageRoute<dynamic> homeRoute() {
  return MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  );
}

MaterialPageRoute<dynamic> trainerDetailsRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerDetailsScreen(),
  );
}

MaterialPageRoute<dynamic> addReviewRoute() {
  return MaterialPageRoute(
    builder: (context) => const AddReview(),
  );
}

MaterialPageRoute<dynamic> successStoryRoute() {
  return MaterialPageRoute(
    builder: (context) => const SuccessStory(),
  );
}

MaterialPageRoute<dynamic> eReceiptRoute() {
  return MaterialPageRoute(
    builder: (context) => EReceiptScreen(),
  );
}

MaterialPageRoute<dynamic> congratulationRoute() {
  return MaterialPageRoute(
    builder: (context) => const CongratulationScreen(),
  );
}

MaterialPageRoute<dynamic> workoutReviewRoute() {
  return MaterialPageRoute(
    builder: (context) => const WorkoutReview(),
  );
}
MaterialPageRoute<dynamic> sportsClubRoute() {
  return MaterialPageRoute(
    builder: (context) => const SportsClubScreen(),
  );
}
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
