import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

import '../../../../../core/utils/text_styles.dart';

class CustomAuthButton extends StatefulWidget {
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
  State<CustomAuthButton> createState() => _CustomAuthButtonState();
}

class _CustomAuthButtonState extends State<CustomAuthButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isActive
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.w),
            ),
          ),
        ),
        onPressed: widget.isActive ? widget.onPressed : null,
        child: Text(
          widget.text,
          style: TextStyles.textStyleMedium.copyWith(color: AppColors.background,fontSize:16.sp),
        ),
      ),
    );
  }
}
