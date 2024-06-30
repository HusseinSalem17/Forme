import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_state.dart';

class AnimatedStepperLine extends StatelessWidget {
  final PreferencesState state;

  const AnimatedStepperLine({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.sizeOf(context).width/1.8,
          height: 4,
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: (state.page + 1) * 42.4,
          height: 4,
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
