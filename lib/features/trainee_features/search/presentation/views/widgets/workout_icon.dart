import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class WorkoutIcon extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  const WorkoutIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:8.h),
          child: Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.n20Gray),
            child: SvgPicture.asset(
              'assets/image/Icon/$icon.svg',
              color: AppColors.primaryColor,
              fit: BoxFit.none,
            ),
          ),
        ));
  }
}
