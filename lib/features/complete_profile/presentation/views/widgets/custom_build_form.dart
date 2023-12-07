import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomBuildForm extends StatelessWidget {
  final String title;
  final double topPadding, bottomPadding;
  final bool optional;
  final Widget child;
  const CustomBuildForm({
    super.key,
    this.optional = false,
    required this.title,
    required this.child,
    this.bottomPadding = 4.0,
    this.topPadding = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: optional
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyles.textStyleBold.copyWith(
                          color: AppColors.n900PrimaryTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '(optional)',
                        style: TextStyles.textStyleRegular.copyWith(
                          color: AppColors.n100Color,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  )
                : Text(
                    title,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900PrimaryTextColor,
                      fontSize: 14.sp,
                    ),
                  )),
        child,
      ],
    );
  }
}
