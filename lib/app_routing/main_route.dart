import 'package:flutter/material.dart';
import 'package:forme_app/app_routing/trainee_routes.dart';
import 'package:forme_app/app_routing/trainer_routes.dart';
import '../core/user_type.dart';

import '../features/trainee_features/home/presentation/views/trainee_home_screen_bottom_nav.dart';
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
                context,
              )
            : TraineeRoutes().generateRoute(
                const RouteSettings(
                  name: TraineeHomeScreenBottomNav.routeName,
                ),
                context,
              );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Route not found in main route'),
            ),
          ),
        );
    }
  }
}
