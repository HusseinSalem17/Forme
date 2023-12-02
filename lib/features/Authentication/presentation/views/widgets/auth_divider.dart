import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 80.w,
          height: 1.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.n70HintColor),
        ),
        Text(
          "Or sign in with",
          style: Styles.textStyleRegular
              .copyWith(color: AppColors.n70HintColor,fontSize:14.sp),
        ),
        Container(
          width: 80.w,
          height: 1.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.n70HintColor),
        ),
      ],
    );
  }
}
