import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class IconLeftArrowButton extends StatefulWidget {
  const IconLeftArrowButton({super.key});

  @override
  State<IconLeftArrowButton> createState() => _IconLeftArrowButtonState();
}

class _IconLeftArrowButtonState extends State<IconLeftArrowButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      width: 80.w,
      child: Icon(
        Icons.arrow_circle_left_outlined,
        color: AppColors.p300PrimaryColor,
        size: 55.w,
      ),
    );
  }
}
