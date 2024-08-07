import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int page;
  const DotIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 100.w,
      child: DotsIndicator(
        position: page,
        dotsCount: 3,
        decorator: DotsDecorator(
          color: AppColors.n50dropShadowColor,
          activeColor: AppColors.primaryColor,
          size: const Size.square(12.0),
          activeSize: const Size(36.0, 12.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
