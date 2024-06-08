import 'package:flutter/material.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/views/widgets/trainer_complete_profile_body.dart';

class TrainerCompleteProfile extends StatelessWidget {
  static const routeName = '/trainer-complete-Profile';
  const TrainerCompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: TrainerCompleteProfileBody()),
    );
  }
}
