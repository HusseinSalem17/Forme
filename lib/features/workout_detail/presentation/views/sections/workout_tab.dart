import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/workout_detail/presentation/views/widgets/workout_lesson.dart';

class WorkoutTab extends StatelessWidget {
  const WorkoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lessons',
            style: TextStyles.textStyleBold
                .copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const WorkoutLesson();
              },
            ),
          ),
        ],
      ),
    );
  }
}
