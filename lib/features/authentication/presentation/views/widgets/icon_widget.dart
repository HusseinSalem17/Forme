import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

GestureDetector iconWidget({
  required double width,
  required double height,
  required String iconName,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.n40Gray, width: 1),
      ),
      width: 60,
      height: 60,
      child: Center(
        child: SvgPicture.asset(
          fit: BoxFit.contain,
          iconName,
          height: height,
          width: width,
        ),
      ),
    ),
  );
}
