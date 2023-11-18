import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class IconRightArrowButton extends StatelessWidget {
  const IconRightArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      width: 80.w,
      child: Icon(
        Icons.arrow_circle_right,
        color: AppColors.p300PrimaryColor,
        size: 55.w,
        weight: 800,
      ),
    );
  }
}
