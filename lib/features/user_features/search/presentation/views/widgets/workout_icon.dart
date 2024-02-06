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
          padding: EdgeInsets.all(8.h),
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.dg), color: AppColors.n20FillBodyInSmallCardColor),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: SvgPicture.asset(
                'assets/image/Icon/$icon.svg',
                color: AppColors.p300PrimaryColor,
              ),
            ),
          ),
        ));
  }
}
