import 'package:flutter/material.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/widgets/trainee_complete_profile_body.dart';

class TraineeCompleteProfileScreen extends StatelessWidget {
  static const routeName = '/trainer-complete-Profile';
  const TraineeCompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TraineeCompleteProfileBody(),
      ),
    );
  }
}
