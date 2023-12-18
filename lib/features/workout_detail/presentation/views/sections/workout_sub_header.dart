import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home/presentation/views/widgets/card_review_section.dart';

class Workout_sub_header extends StatelessWidget {
  const Workout_sub_header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children:[
    SizedBox(
      height: 26.h,
    ),
    const CardReviewSection(),
    SizedBox(
      height: 16.h,
    ),
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Pulse Fitness Center',
        style: TextStyles.textStyleMedium.copyWith(
            fontSize: 16.sp, color: AppColors.n900PrimaryTextColor),
      ),
    ),
    SizedBox(
      height: 8.h,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/image/personicon.svg'),
        SizedBox(width: 6.w),
        Text(
          'Ahmed Ramy',
          style: TextStyles.cardTextStyle.copyWith(
            color: AppColors.n200BodyContentColor,
            fontSize: 11.sp,
          ),
        ),
        const Spacer(),
        SvgPicture.asset('assets/image/Icon/PlayBorder.svg'),
        SizedBox(width: 6.w),
        Text(
          '10 Workout',
          style: TextStyles.cardTextStyle.copyWith(
            color: AppColors.n200BodyContentColor,
            fontSize: 11.sp,
          ),
        ),
      ],
    ),
    SizedBox(
      height: 18.h,
    ),]);
  }
}