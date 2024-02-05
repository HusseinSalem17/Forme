import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

GestureDetector profileFeature(
      String icon, String title, void Function()? onTap, Color textColor) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: SvgPicture.asset('assets/image/profile/$icon.svg'),
              ),
              Text(
                title,
                style: TextStyles.textStyleRegular
                    .copyWith(height: 3, fontSize: 16.w, color: textColor),
              ),
              const Spacer(),
              Visibility(
                visible: textColor != AppColors.d300Danger
                    ? true
                    : false, // Set this to your condition
                child: SvgPicture.asset('assets/image/profile/arrow.svg'),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: AppColors.n30StrokeColor,
          )
        ],
      ),
    );
  }