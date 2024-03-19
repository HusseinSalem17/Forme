import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/book_appointment_with%20_trainer/presentation/views/book_appointment_screen.dart';
import 'package:forme_app/features/user_features/join_program_feature/presentation/views/book_onling_coach_screen.dart';
import 'package:forme_app/features/user_features/maps/presentation/views/map_screen.dart';

class TraineeRoutes {
  MaterialPageRoute<dynamic> bookAppointmentWithTrainer() {
    return MaterialPageRoute(
      builder: (context) => const BookAppointmentScreen(),
    );
  }

  MaterialPageRoute<dynamic> bookOnlineCoachScreen() {
    return MaterialPageRoute(
      builder: (context) => const BookOnlineCoachScreen(),
    );
  }

  MaterialPageRoute<dynamic> mapScreen() {
    return MaterialPageRoute(
      builder: (context) => const MapScreen(),
    );
  }
}
