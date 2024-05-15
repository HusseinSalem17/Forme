import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_card_review.dart';

Padding clubSubHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.h),
    child: Column(children: [
      SizedBox(
        height: 26.h,
      ),
      SpecialProgramsCardReview(),
      SizedBox(
        height: 16.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pulse Fitness Center',
                style: TextStyles.textStyleMedium
                    .copyWith(fontSize: 16.sp, color: AppColors.n900Black),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/image/Icon/pin-map.svg',
                      color: AppColors.primaryColor),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    'Port Said, EGY',
                    style: TextStyles.textStyleRegular.copyWith(
                        fontSize: 11.sp, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/image/Icon/direction.svg'),
        ],
      ),
    ]),
  );
}
