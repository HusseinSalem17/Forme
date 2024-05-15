import 'package:flutter/material.dart';
import 'package:forme_app/app_routing/trainee_routes.dart';
import 'package:forme_app/app_routing/trainer_routes.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/trainer_complete_profile.dart';

import '../core/user_type.dart';
import '../features/trainee_features/home/presentation/views/bottom_bar_screens.dart';
import '../features/trainer_features/dashboard/presentation/views/home_view.dart';

class AppRouter {
  final BuildContext context;
  UserType userType;

  AppRouter({
    this.userType = UserType.trainer,
    required this.context,
  });

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return userType == UserType.trainer
            ? TrainerRoutes().generateRoute(
                const RouteSettings(
                  name: TrainerHomeScreen.routeName,
                ),
                context)
            : TraineeRoutes().generateRoute(
                const RouteSettings(
                  name: HomeScreen.routeName,
                ),
                context);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Error: Route not found'),
            ),
          ),
        );
    }
  }
}