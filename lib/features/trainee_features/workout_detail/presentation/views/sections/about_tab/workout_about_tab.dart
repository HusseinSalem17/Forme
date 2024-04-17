import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/widgets/trainer_description.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/sections/about_tab/fitness_trainer.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/widgets/custom_table.dart';

class WorkoutAboutTab extends StatelessWidget {
  const WorkoutAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Description',
          style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
        ),
        const TrainerDescription(),
        Text(
          'Fitness Trainer',
          style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
        ),
        const FitnessTrainerSection(),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
          child: Text(
            'Info',
            style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
          ),
        ),
        const CustomTable()
      ]),
    );
  }
}
