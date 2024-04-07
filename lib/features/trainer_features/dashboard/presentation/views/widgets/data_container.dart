 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

Padding dataContainer(
      String title1, String rate1, String title2, String rate2) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.n20FillBodyInSmallCardColor,
            border: Border.all(width: 1.sp, color: AppColors.border30),
            borderRadius: BorderRadius.circular(16.dg),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title1,
                        style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.n900Black)),
                    Text(rate1,
                        style: TextStyles.textStyleRegular.copyWith(
                            height: 2,
                            fontSize: 14.sp,
                            color: AppColors.primaryColor)),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.n40BorderColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title2,
                        style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.n900Black)),
                    Text(rate2,
                        style: TextStyles.textStyleRegular.copyWith(
                            height: 2,
                            fontSize: 14.sp,
                            color: AppColors.primaryColor)),
                  ],
                )
              ],
            ),
          )),
    );
  }