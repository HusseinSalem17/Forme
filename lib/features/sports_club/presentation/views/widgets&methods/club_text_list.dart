import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

Row clubTextList(List<String> title, List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            title.length,
            (int index) {
              return Text(
                title[index],
                style: TextStyles.textStyleRegular.copyWith(height: 2,fontSize: 12.sp),
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List<Widget>.generate(
            values.length,
            (int index) {
              return Text(
                values[index],
                style: TextStyles.textStyleRegular.copyWith(height: 2,
                    fontSize: 12.sp, color: AppColors.n900PrimaryTextColor),
              );
            },
          ),
        )
      ],
    );
  }

