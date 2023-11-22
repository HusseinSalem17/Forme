import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.p300PrimaryColor,
      radius: 21.w,
      child: Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.background,
        size: 21.w,
      ),
    );
  }
}
