import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code.dart';
import 'package:forme_app/features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/home_view.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/my_services_screen.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/subscriptions_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/favorite_screen.dart';
import 'package:forme_app/features/user_features/Notification/presentation/views/notification_screen.dart';
import 'package:forme_app/features/user_features/Payment/presentation/view/ereceipt_screen.dart';
import 'package:forme_app/features/user_features/Trainer_details/presentation/views/success_story.dart';
import 'package:forme_app/features/user_features/Trainer_details/presentation/views/trainer_details_view.dart';
import 'package:forme_app/features/user_features/featured/presentation/featured_screen.dart';
import 'package:forme_app/features/user_features/home/presentation/views/home_view.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/add_new_card_screen.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/congratulation_screen.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/payment_successfully_screen.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/help_center/help_center.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/my_profile.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/privacy_policy.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/settings_screen.dart';
import 'package:forme_app/features/user_features/reviews/presentation/views/add_review.dart';
import 'package:forme_app/features/user_features/search/presentation/search_screen.dart';
import 'package:forme_app/features/user_features/search/presentation/views/filter/filter_screen.dart';
import 'package:forme_app/features/user_features/sports_club/presentation/views/sports_club.dart';
import 'package:forme_app/splash_screen.dart';
import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';
import 'features/trainer_features/Trainer_Notification/presentation/views/trainer_notification_screen.dart';
import 'features/trainer_features/Trainer_Profile/presentation/views/trainer_profile_screen.dart';
import 'features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import 'features/trainer_features/client_list/presentation/views/client_list_screen.dart';
import 'features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'features/trainer_features/create_sessions/presentation/views/create_session.dart';
import 'features/trainer_features/trainee_profile/presentation/views/trainee_profile_screen.dart';
import 'features/user_features/payment/presentation/view/payment_methods_screen.dart';
import 'features/user_features/preferences/presentation/views/preferences_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
//----- Splash Routing -----
    case '/':
      return
          //subscriptionsScreenRoute();
          trainerHomeRoute();

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
      return newPasswordRoute();
//------------------------------------------- user section ------------------------
//---------- Preferences Routing -----
    case PreferencesScreen.routeName:
      return preferencesScreenRoute();

//------------ Home Routing -----------
    case HomeScreen.routeName:
      return homeRoute();
//-------- Trainer Details Routing ----
    case TrainerDetailsScreen.routeName:
      return trainerDetailsRoute();

    case SuccessStory.routeName:
      return successStoryRoute();
//------ Complete Profile Routing ----
    case CompleteProfile.routeName:
      return completeProfile();
//------------ Review Routing --------
    case AddReview.routeName:
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final String type = args[0] as String;
      return addReviewRoute(type);
//--------- payment Routing ----------
    case CongratulationScreen.routeName:
      return congratulationRoute();
    case EReceiptScreen.routeName:
      return eReceiptRoute();
    case AddNewCardScreen.routeName:
      return addNewCardRoute();
    case PaymentMethodsScreen.routeName:
      return paymentMethodsRoute();
//------ sports club Routing -------
    case SportsClubScreen.routeName:
      return sportsClubRoute();
//------- featured Routing -------
    case FeaturedScreen.routeName:
      final List<dynamic> args = settings.arguments as List<dynamic>;
      final List<String> filterType = args[0] as List<String>;
      final String featuredType = args[1] as String;
      return featuredRoute(filterType, featuredType);
//-------- profile Routing -------
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
//------ Search Routing ----------
    case SearchScreen.routeName:
      return searchScreenRoute();
    case FilterScreen.routeName:
      return filterScreenRoute();
//------ Notification Routing ------
    case NotificationScreen.routeName:
      return notificationScreenRoute();
//------ Favorite Routing ------
    case FavoriteScreen.routeName:
      return favoriteScreenRoute();
//------------------------------------------- trainer section -----------------------
//-------- Home Routing -----------
    case TrainerHomeScreen.routeName:
      return trainerHomeRoute();
//-------- Preferences Routing -----------
    case TrainerPreferenceScreen.routeName:
      return trainerPreferencesScreenRoute();
//-------- Complete Profile Routing -----------
    case TrainerCompleteProfile.routeName:
      return trainerCompleteProfileRoute();
//-------- My Services Routing -----------
    case MyServicesScreen.routeName:
      return trainerMyServicesScreen();
//-------- Add Program Routing -----------
    case AddProgramScreen.routeName:
      return addProgramRoute();
//-------- Revenue Routing -----------
    case RevenueScreen.routeName:
      return revenueScreenRoute();
//-------- Client list Routing -----------
    case ClientListScreen.routeName:
      return trainerClientListScreen();
//-------- Create Session Routing -----------
    case CreateSessionScreen.routeName:
      return createSessionRoute();
//-------- Subscriptions Routing -----------
    case SubscriptionsScreen.routeName:
      return subscriptionsScreenRoute();
//-------- Notification Routing -----------
    case TrainerNotificationScreen.routeName:
      return trainerNotificationScreenRoute();
//-------- Trainee Profile Routing -----------
    case TraineeProfile.routeName:
      return traineeProfileScreenRoute();
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

MaterialPageRoute<dynamic> homeRoute() {
  return MaterialPageRoute(
    builder: (context) => const AddNewCardScreen(),
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

MaterialPageRoute<dynamic> paymentMethodsRoute() {
  return MaterialPageRoute(
    builder: (context) => const PaymentMethodsScreen(),
  );
}

MaterialPageRoute<dynamic> addNewCardRoute() {
  return MaterialPageRoute(
    builder: (context) => const AddNewCardScreen(),
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

MaterialPageRoute<dynamic> featuredRoute(List<String> filterType, String featureType) {
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

MaterialPageRoute<dynamic> searchScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const SearchScreen(),
  );
}

MaterialPageRoute<dynamic> filterScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const FilterScreen(),
  );
}

MaterialPageRoute<dynamic> notificationScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const NotificationScreen(),
  );
}

MaterialPageRoute<dynamic> favoriteScreenRoute() {
  return MaterialPageRoute(
    builder: (context) => const FavoriteScreen(),
  );
}

// ---------------- trainer section --------------

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
    builder: (context) => const TraineeProfile(),
  );
}