import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';

class TwoButtonsContainer extends StatelessWidget {
  final String firstButtonTitle;
  final String secondButtonTitle;
  final bool havePrice;
  final Color color;
  final void Function()? onTap;
  const TwoButtonsContainer({super.key, required this.firstButtonTitle, this.havePrice = false, this.onTap, this.color = AppColors.primaryColor, required this.secondButtonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6.h,
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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.dg), topRight: Radius.circular(20.dg))),
      padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 20.h, bottom: (MediaQuery.sizeOf(context).height / 6.h) - 68.h),
      child: Row(
        children: [
          CustomAppButton(
            title: firstButtonTitle,
            onTap: onTap,
            color: AppColors.n20Gray,
            titleColor: AppColors.primaryColor,
            widthDivider: 2.25.h,
            isShadow: false,
          ),
          SizedBox(width: 16.w),
          CustomAppButton(
            title: secondButtonTitle,
            onTap: onTap,
            color: color,
            widthDivider: 2.25.h,
          ),
        ],
      ),
    );
  }
}
