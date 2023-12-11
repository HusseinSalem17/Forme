import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

//temp widget for handling text styles
class CustomText extends StatelessWidget {
  final String text1, text2;
  final void Function()? onTap;
  const CustomText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp),
        ),
        GestureDetector(
          onTap: onTap,
          child: FittedBox(
            child: Text(
              text2,
              style: TextStyles.textStyleRegular.copyWith(
                color: AppColors.p300PrimaryColor,
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
