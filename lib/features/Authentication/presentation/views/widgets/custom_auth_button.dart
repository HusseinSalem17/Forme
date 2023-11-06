import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:12.0.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.p300PrimaryColor,
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
            style: Styles.textStyleMedium18.copyWith(color: AppColors.background),
          ),
        ),
      ),
    );
  }
}
