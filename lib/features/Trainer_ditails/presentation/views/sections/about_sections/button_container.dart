import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/custom_app_botton.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.dg),
              topRight: Radius.circular(20.dg))),
      padding: EdgeInsets.all(23.h),
      child: const CustomAppBottom(title: 'Book Appointment'),
    );
  }
}
