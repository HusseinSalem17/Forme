import 'package:flutter/material.dart';

import '../features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import '../features/trainer_features/Trainee_profile/presentation/views/trainee_profile_screen.dart';
import '../features/trainer_features/Trainer_Notification/presentation/views/trainer_notification_screen.dart';
import '../features/trainer_features/Trainer_Profile/presentation/views/trainer_profile_screen.dart';
import '../features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import '../features/trainer_features/client_list/presentation/views/client_list_screen.dart';
import '../features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import '../features/trainer_features/create_sessions/presentation/views/create_session.dart';
import '../features/trainer_features/dashboard/presentation/views/home_view.dart';
import '../features/trainer_features/my_services/presentation/views/my_services_screen.dart';
import '../features/trainer_features/subscriptions/presentation/views/subscriptions_screen.dart';
import '../features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';

class TrainerRoutes {
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

  MaterialPageRoute<dynamic> trainerMyServicesRoute() {
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
}
