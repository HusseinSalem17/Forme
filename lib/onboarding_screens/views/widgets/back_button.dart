import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      radius: 21.w,
      child: CircleAvatar(
        backgroundColor: AppColors.background,
        radius: 19.w,
        child: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.primaryColor,
          size: 21.w,
        ),
      ),
    );
  }
}
