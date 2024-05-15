import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

Padding filterType(name) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Container(
        decoration: BoxDecoration(
            color: AppColors.n20Gray,
            borderRadius: BorderRadius.circular(20.dg)),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
        child: Text(name,
            style: TextStyles.textStyleRegular.copyWith(fontSize: 16.sp))),
  );
}
