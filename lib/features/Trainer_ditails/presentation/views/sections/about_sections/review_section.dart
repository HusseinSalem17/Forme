import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Trainer_ditails/data/models/trainer_review_model.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/add_review.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/widgets/trainger_review.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.w),
            child: Row(
              children: [
                Text(
                  'Reviews',
                  style: TextStyles.textStyleBold.copyWith(
                      fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
                ),
                const Spacer(),
                SvgPicture.asset('assets/image/Icon/tabler_pencil-minus.svg'),
                GestureDetector(
                  child: Text(
                    'add review',
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 11.sp, color: AppColors.p300PrimaryColor),
                  ),
                  onTap: (){
                    Navigator.of(context)
                    .push(PageSlideTransition(const AddReview()));
                  },
                ),
              ],
            ),
          ),
          Column(
            children: List<Widget>.generate(
              4,
              (int index) => ReviewWidget(model: reviewData[index]),
            ),
          ),
        ],
      ),
    );
  }
}
