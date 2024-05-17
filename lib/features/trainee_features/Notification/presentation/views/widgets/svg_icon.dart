import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String iconName;

  const SvgIcon({
    Key? key,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: const BoxDecoration(
        color: AppColors.fillColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: SvgPicture.asset(
          'assets/images/$iconName.svg',
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
