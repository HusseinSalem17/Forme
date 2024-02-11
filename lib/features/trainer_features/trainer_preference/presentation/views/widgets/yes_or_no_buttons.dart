import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({super.key});

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  int selectedButton = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: selectedButton == 1 ? AppColors.p50PrimaryColor : AppColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedButton == 1 ? AppColors.p300PrimaryColor : AppColors.n200BodyContentColor,
              ),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedButton = 1;
                });
              },
              child: Text(
                'Yes',
                style: TextStyles.textStyleSemiBold.copyWith(
                  fontSize: 14.sp,
                  color: selectedButton == 1 ? AppColors.p300PrimaryColor : AppColors.n200BodyContentColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: selectedButton == 2 ? AppColors.p50PrimaryColor : AppColors.background,
              border: Border.all(
                color: selectedButton == 2 ? AppColors.p300PrimaryColor : AppColors.n200BodyContentColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedButton = 2;
                });
              },
              child: Text(
                'No',
                style: TextStyles.textStyleSemiBold.copyWith(
                  fontSize: 14.sp,
                  color: selectedButton == 2 ? AppColors.p300PrimaryColor : AppColors.n200BodyContentColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
