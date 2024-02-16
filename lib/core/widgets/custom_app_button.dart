import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomAppButton extends StatelessWidget {
  final String title;
  final double widthDivider, height, padding, fontSize;
  final void Function()? onTap;
  final Color color, titleColor;
  final bool isShadow;
  const CustomAppButton({
    super.key,
    required this.title,
    this.onTap,
    this.widthDivider = 1,
    this.color = AppColors.p300PrimaryColor,
    this.titleColor = AppColors.background,
    this.height = 48,
    this.padding = 16,
    this.fontSize = 16,
    this.isShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          height: height.h,
          width: MediaQuery.sizeOf(context).width / widthDivider,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.dg),
            color: color,
            boxShadow: [
              isShadow
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    )
                  : const BoxShadow(color: Colors.transparent, blurRadius: 0, offset: Offset(0, 0)),
            ],
          ),
          padding: EdgeInsets.all(padding.h),
          child: Center(
            child: Text(
              title,
              style: TextStyles.textStyleMedium.copyWith(fontSize: fontSize.sp, color: titleColor, height: 1),
            ),
          ),
        ),
      ),
    );
  }
}
