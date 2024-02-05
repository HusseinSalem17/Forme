import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_state.dart';


class AnimatedStepperLine extends StatelessWidget {
  final TrainerPreferenceState state;

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
          width: 220.w,
          height: 4,
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: AppColors.p300PrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: (state.page + 1) * 110.w,
          height: 4,
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
