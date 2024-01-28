import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/home_view.dart';
import 'package:forme_app/features/user_features/Payment/presentation/view/ereceipt_screen.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/presentation/views/success_story.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/presentation/views/trainer_details_view.dart';
import 'package:forme_app/features/user_features/featured/presentation/featured_screen.dart';
import 'package:forme_app/features/user_features/home/presentation/views/home_view.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/congratulation_screen.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/help_center/help_center.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/my_profile.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/privacy_policy.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/settings_screen.dart';
import 'package:forme_app/features/user_features/reviews/presentation/views/add_review.dart';
import 'package:forme_app/features/user_features/sports_club/presentation/views/sports_club.dart';
import 'package:forme_app/splash_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';
import 'features/user_features/join_program_feature/presentation/views/payment_successfully_screen.dart';
import 'features/user_features/preferences/presentation/views/preferences_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- Splash Routing -----
    case '/':
      return trainerHomeRoute();
    //homeRoute();
    // splashRoute();

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
//------------------------------------------- user section ------------------------
//----- Preferences Routing -----
    case PreferencesScreen.routeName:
      return preferencesScreenRoute();

//-------- Home Routing -----------
    case HomeScreen.routeName:
      return homeRoute();
//---- Trainer Details Routing ----
    case TrainerDetailsScreen.routeName:
      return trainerDetailsRoute();

    case SuccessStory.routeName:
      return successStoryRoute();
//--- Complete Profile Routing ----
    case CompleteProfile.routeName:
      return completeProfile();
//--------- Review Routing --------
    case AddReview.routeName:
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final String type = args[0] as String;
      return addReviewRoute(type);
//------ payment Routing ----------
    case CongratulationScreen.routeName:
      return congratulationRoute();
    case EReceiptScreen.routeName:
      return eReceiptRoute();
//----- sports club Routing -------
    case SportsClubScreen.routeName:
      return sportsClubRoute();
//----- featured Routing -------
    case FeaturedScreen.routeName:
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final List<String> filterType = args[0] as List<String>;
      final String featuredType = args[1] as String;
      return featuredRoute(filterType, featuredType);
//----- profile Routing -------
    case MyProfile.routeName:
      return myProfileRoute();
    case SettingsScreen.routeName:
      return settingsRoute();
    case HelpCenter.routeName:
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final List<String> filterType = args[0] as List<String>;
      return helpCenterRoute(filterType);
    case PrivacyPolicy.routeName:
      return privacyPolicyRoute();
//------------------------------------------- trainer section -----------------------
//-------- Home Routing -----------
    case TrainerHomeScreen.routeName:
      return trainerHomeRoute();
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
    builder: (context) => const PaymentSuccessfullyScreen(),
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

MaterialPageRoute<dynamic> addReviewRoute(String type) {
  return MaterialPageRoute(
    builder: (context) => AddReview(
      type: type,
    ),
  );
}

MaterialPageRoute<dynamic> sportsClubRoute() {
  return MaterialPageRoute(
    builder: (context) => const SportsClubScreen(),
  );
}

MaterialPageRoute<dynamic> featuredRoute(
    List<String> filterType, String featureType) {
  return MaterialPageRoute(
    builder: (context) => FeaturedScreen(
      filterTypes: filterType,
      featureType: featureType,
    ),
  );
}

MaterialPageRoute<dynamic> myProfileRoute() {
  return MaterialPageRoute(
    builder: (context) => const MyProfile(),
  );
}

MaterialPageRoute<dynamic> settingsRoute() {
  return MaterialPageRoute(
    builder: (context) => const SettingsScreen(),
  );
}

MaterialPageRoute<dynamic> helpCenterRoute(List<String> filterTypes) {
  return MaterialPageRoute(
    builder: (context) => HelpCenter(
      filterTypes: filterTypes,
    ),
  );
}

MaterialPageRoute<dynamic> privacyPolicyRoute() {
  return MaterialPageRoute(
    builder: (context) => const PrivacyPolicy(),
  );
}

// ---------------- trainer section --------------

MaterialPageRoute<dynamic> trainerHomeRoute() {
  return MaterialPageRoute(
    builder: (context) => const TrainerHomeScreen(),
  );
}
