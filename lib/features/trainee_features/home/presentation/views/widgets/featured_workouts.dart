import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/featured_workouts_list.dart';

class FeaturedWorkouts extends StatelessWidget {
  final void Function()? onTap;

  const FeaturedWorkouts({
    super.key,
    //this.listHeight = 3.5,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Workouts',
                style: TextStyles.largeBold,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'See all',
                  style: TextStyles.baseRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          child: FeaturedWorkoutsList(),
        ),
      ],
    );
  }
}
