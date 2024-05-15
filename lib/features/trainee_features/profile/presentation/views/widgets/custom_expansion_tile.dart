import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

Padding customExpansionTile(Widget question, String answer) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.w),
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.n40Gray, width: 1)),
      child: ExpansionTile(
        iconColor: AppColors.primaryColor,
        childrenPadding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.w),
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
        ),
        title: question,
        children: [
          const Divider(
            thickness: 1,
            color: AppColors.n40Gray,
          ),
          Text(
            answer,
            style: TextStyles.textStyleRegular
                .copyWith(fontSize: 12.sp, color: AppColors.n200Gray),
          ),
        ],
      ),
    ),
  );
}
