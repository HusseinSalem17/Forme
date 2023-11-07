import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    Key? key,
    required this.text,
    required this.isActive,
    this.onPressed,
  }) : super(key: key);
  final bool isActive;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? AppColors.p300PrimaryColor
              : AppColors.p300PrimaryColor.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.w),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: Styles.textStyleMedium16.copyWith(color: AppColors.background),
        ),
      ),
    );
  }
}
