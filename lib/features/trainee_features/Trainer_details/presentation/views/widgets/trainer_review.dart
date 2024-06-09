import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/data/models/trainer_review_model.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel model;
  const ReviewWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40.h,
                height: 40.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.dg),
                  child: Image.asset(
                    model.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                model.name,
                style: TextStyles.textStyleMedium.copyWith(
                  color: AppColors.n900Black,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              Text(
                '${model.timeAgo} ago',
                style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              model.review,
              style: TextStyles.textStyleRegular
                  .copyWith(fontSize: 12.sp, color: AppColors.n200Gray),
            ),
          ),
          Row(
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: SimpleStarRating(
              //     allowHalfRating: true,
              //     isReadOnly: true,
              //     starCount: 5,
              //     rating: model.rating,
              //     size: 16,
              //     spacing: 8,
              //   ),
              // ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                model.rating.toString(),
                style: TextStyles.textStyleBold.copyWith(fontSize: 11.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
