import 'package:flutter/material.dart';
import 'package:forme_app/features/complete_profile/presentation/views/widgets/complete_profile_body.dart';

class CompleteProfile extends StatelessWidget {
  static const routeName = '/completeProfile';
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CompleteProfileBody(),
      ),
    );
  }
}
