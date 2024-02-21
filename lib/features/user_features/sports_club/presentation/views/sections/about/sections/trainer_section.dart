import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Trainer_details/presentation/views/widgets/custom_clip_rect.dart';

Row trainerSection() {
  return Row(
    children: [
      const CustomClipRect(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ahmed Ramy',
            style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
          ),
          Text(
            'GYM Owner',
            style: TextStyles.textStyleRegular.copyWith(
              fontSize: 11.sp,
            ),
          )
        ],
      ),
    ],
  );
}
