import 'package:flutter/material.dart';
import '../features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import '../features/trainer_features/Trainee_profile/presentation/views/trainee_profile_screen.dart';
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

class TrainerRoutes {
  MaterialPageRoute<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error: Route not found'),
        ),
      ),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case TrainerHomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrainerHomeScreen(),
        );
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
