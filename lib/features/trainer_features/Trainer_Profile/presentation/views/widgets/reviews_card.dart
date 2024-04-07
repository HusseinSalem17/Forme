import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../user_features/Trainer_details/presentation/views/widgets/custom_clip_rect.dart';
import '../../../data/reviews_card_model.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key, required this.size, required this.model});
  final Size size;
  final ReviewsCardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.n20FillBodyInSmallCardColor,
        ),
        color: AppColors.n10Color,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomClipRect(imagePath: 'assets/image/workout_image.jpg',height: 40.h, width: 40.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    model.name,
                    style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    model.date,
                    style: TextStyles.textStyleRegular.copyWith(fontSize: 12.sp, color: AppColors.n200BodyContentColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            model.reviewDescription,
            style: TextStyles.textStyleRegular.copyWith(fontSize: 12.sp, color: AppColors.n200BodyContentColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SimpleStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: model.rating,
                size: 16,
                filledIcon: const Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.starColor,
                ),
                nonFilledIcon: const Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.n20FillBodyInSmallCardColor,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                model.rating.toString(),
                style: TextStyles.textStyleBold.copyWith(fontSize: 11.sp, color: AppColors.n100Gray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
