import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomAppBottom extends StatelessWidget {
  final String title;
  const CustomAppBottom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.p300PrimaryColor,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          title,
          style: Styles.textStyleMedium.copyWith(fontSize: 16.sp,color: AppColors.background),
        ),
      ),
    );
  }
}
