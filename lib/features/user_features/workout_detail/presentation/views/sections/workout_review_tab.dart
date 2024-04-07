import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Trainer_details/data/models/trainer_review_model.dart';
import 'package:forme_app/features/user_features/Trainer_details/presentation/views/widgets/trainer_review.dart';

class WorkoutReviewTab extends StatelessWidget {
  const WorkoutReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              'Reviews',
              style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ReviewWidget(model: reviewData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
