import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomAppBottom extends StatelessWidget {
  final String title;
  final double widthDivider;
  final void Function()? onTap;
  const CustomAppBottom({super.key, required this.title,this.onTap,this.widthDivider=1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          height: 48.h,
          width: MediaQuery.sizeOf(context).width/widthDivider,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.dg),
            color: AppColors.p300PrimaryColor,
            boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
          ),
          padding: EdgeInsets.all(16.0.h),
          child: Center(
            child: Text(
              title,
              style: TextStyles.textStyleMedium
                  .copyWith(fontSize: 16.sp, color: AppColors.background),
            ),
          ),
        ),
      ),
    );
  }
}
