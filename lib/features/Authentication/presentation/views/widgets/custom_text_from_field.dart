import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:4.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical:8.0.h),
            child: Text(
              'Email',
              style: Styles.textStyleBold16
                  .copyWith(color: AppColors.n900PrimaryTextColor),
            ),
          ),
          TextFormField(
            cursorColor: AppColors.p300PrimaryColor,
            style: Styles.hintStyle,
            // obscureText: widget.keyboardType == TextInputType.visiblePassword &&
            //     _obscureText,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              hintText: 'example@gmail.com',
              hintStyle: Styles.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.n100Color,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.p300PrimaryColor,
                ),
              ),
              errorMaxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
