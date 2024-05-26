import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';

class AnimatedStepperLine extends StatelessWidget {
  const AnimatedStepperLine({
    super.key,
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
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: (context.read<TrainerPreferenceCubit>().page + 1) * 110.w,
          height: 4,
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
