import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';


class CardReviewSection extends StatelessWidget {
  const CardReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 85.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: AppColors.n20FillBodyInSmallCardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Yoga',
                  style: Styles.cardTextStyle,
                ),
                Container(
                  width: 0.5,
                  height: 9,
                  color: AppColors.p300PrimaryColor,
                ),
                const Text(
                  'Online Coaching',
                  style: Styles.cardTextStyle,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star_rounded,
              size: 14,
              color: AppColors.starColor,
            ),
            Text(
              '4.9 (17 Reviews)',
              style: Styles.cardTextStyle.copyWith(
                color: AppColors.n200BodyContentColor,
                fontSize: 9,
              ),
            )
          ],
        )
      ],
    );
  }
}