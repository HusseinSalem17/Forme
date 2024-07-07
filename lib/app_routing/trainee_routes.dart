import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code_screen.dart';
import 'package:forme_app/features/trainee_features/book_appointment_with%20_trainer/presentation/views/book_appointment_screen.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/trainee_complete_profile_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/trainee_home_screen_bottom_nav.dart';
import 'package:forme_app/features/trainee_features/join_program_feature/presentation/views/book_onling_coach_screen.dart';
import 'package:forme_app/features/trainee_features/maps_feature/presentation/views/map_screen.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/preferences_screen.dart';
import '../features/trainee_features/Favorite/presentation/views/favorite_screen.dart';
import '../features/trainee_features/Notification/presentation/views/notification_screen.dart';
import '../features/trainee_features/Payment/presentation/view/ereceipt_screen.dart';
import '../features/trainee_features/Trainer_details/presentation/views/success_story.dart';
import '../features/trainee_features/Trainer_details/presentation/views/trainer_details_view.dart';
import '../features/trainee_features/featured/presentation/featured_screen.dart';
import '../features/trainee_features/maps_feature/presentation/views/widgets/custom_google_map_2.dart';
import '../features/trainee_features/payment/presentation/view/add_new_card_screen.dart';
import '../features/trainee_features/payment/presentation/view/congratulation_screen.dart';
import '../features/trainee_features/payment/presentation/view/payment_methods_screen.dart';
import '../features/trainee_features/profile/presentation/views/help_center/help_center.dart';
import '../features/trainee_features/profile/presentation/views/my_profile.dart';
import '../features/trainee_features/profile/presentation/views/privacy_policy.dart';
import '../features/trainee_features/profile/presentation/views/settings_screen.dart';
import '../features/trainee_features/reviews/presentation/views/add_review.dart';
import '../features/trainee_features/search/presentation/search_screen.dart';
import '../features/trainee_features/search/presentation/views/filter/filter_screen.dart';
import '../features/trainee_features/sports_club/presentation/views/sports_club.dart';
import '../features/trainer_features/dashboard/presentation/views/home_view.dart';



import 'package:flutter/material.dart';
import '../features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import '../features/trainer_features/Trainee_profile/presentation/views/trainee_profile_screen_t.dart';
import '../features/trainer_features/Trainer_Notification/presentation/views/trainer_notification_screen.dart';
import '../features/trainer_features/Trainer_Profile/presentation/views/trainer_profile_screen.dart';
import '../features/trainer_features/Transformations/presentation/view/Transformations_screen.dart';
import '../features/trainer_features/Transformations/presentation/view/screens/add_transformation.dart';
import '../features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import '../features/trainer_features/add_workout/presentation/view/add_workout.dart';
import '../features/trainer_features/client_list/presentation/views/client_list_screen.dart';
import '../features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import '../features/trainer_features/create_sessions/presentation/views/create_session.dart';
import '../features/trainer_features/dashboard/presentation/views/home_view.dart';
import '../features/trainer_features/my_services/presentation/views/my_services_screen.dart';
import '../features/trainer_features/subscriptions/presentation/views/subscriptions_screen.dart';
import '../features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';

class TraineeRoutes {
  MaterialPageRoute<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error: Route not found in trainee route'),
        ),
      ),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case TraineeHomeScreenBottomNav.routeName:
        return MaterialPageRoute(
          builder: (context) => const TraineeHomeScreenBottomNav(),
        );
      case VerifyCodeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VerifyCodeScreen(),
        );
      case TrainerHomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerHomeScreen(),
        );

      case BookAppointmentScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const BookAppointmentScreen(),
        );
      case BookOnlineCoachScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const BookOnlineCoachScreen(),
        );
      case CustomGoogleMap.routeName:
        return MaterialPageRoute(
          builder: (context) => const CustomGoogleMap(),
        );
      case PreferencesScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const PreferencesScreen(),
        );

      case TrainerDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerDetailsScreen(),
        );
      case SuccessStory.routeName:
        return MaterialPageRoute(
          builder: (context) => const SuccessStory(),
        );
      case TraineeCompleteProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TraineeCompleteProfileScreen(),
        );
      case AddReview.routeName:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final String type = args[0] as String;
        return MaterialPageRoute(
          builder: (context) => AddReview(
            type: type,
          ),
        );
      case CongratulationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CongratulationScreen(),
        );
      case EReceiptScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => EReceiptScreen(),
        );
      case AddNewCardScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddNewCardScreen(),
        );
      case PaymentMethodsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const PaymentMethodsScreen(),
        );
      case SportsClubScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SportsClubScreen(),
        );
      case FeaturedScreen.routeName:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final List<String> filterType = args[0] as List<String>;
        final String featuredType = args[1] as String;
        return MaterialPageRoute(
          builder: (context) => FeaturedScreen(
            filterTypes: filterType,
            featureType: featuredType,
          ),
        );
      case MyProfile.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyProfile(),
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case HelpCenter.routeName:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final List<String> filterTypes = args[0] as List<String>;
        return MaterialPageRoute(
          builder: (context) => HelpCenter(
            filterTypes: filterTypes,
          ),
        );
      case PrivacyPolicy.routeName:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicy(),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case FilterScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        );
      case NotificationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case FavoriteScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );
         /// i will delete them
      case TrainerPreferenceScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerPreferenceScreen(),
        );
      case TrainerCompleteProfile.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerCompleteProfile(),
        );
      case MyServicesScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyServicesScreen(),
        );
      case AddProgramScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddProgramScreen(),
        );
      case RevenueScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RevenueScreen(),
        );
      case ClientListScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ClientListScreen(),
        );
      case CreateSessionScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CreateSessionScreen(),
        );
      case SubscriptionsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionsScreen(),
        );
      case TrainerNotificationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerNotificationScreen(),
        );
      case TrainerProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerProfileScreen(),
        );
      case TraineeProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TraineeProfileScreen(),
        );
      case TransformationsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TransformationsScreen(),
        );
      case AddTransformation.routeName:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final String title = args[0] as String;
        return MaterialPageRoute(
          builder: (context) => AddTransformation(
            title: title,
          ),
        );
      case AddWorkoutScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddWorkoutScreen(),
        );



      default:
        return _errorRoute();
    }
  }
}
