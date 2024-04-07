import 'package:flutter/material.dart';

import '../features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import '../features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import '../features/trainer_features/dashboard/presentation/views/home_view.dart';
import '../features/trainer_features/my_services/presentation/views/my_services_screen.dart';
import '../features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';

class TrainerRoutes{
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
}