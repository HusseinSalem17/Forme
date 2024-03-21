import 'package:flutter/material.dart';
import 'widgets/trainer_notification_body.dart';

class TrainerNotificationScreen extends StatelessWidget {
  static const routeName = '/trainer-notification';
  const TrainerNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrainerNotificationScreenBody();
  }
}