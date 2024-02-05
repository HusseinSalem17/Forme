import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/Notification/presentation/views/widgets/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationScreenBody();
  }
}