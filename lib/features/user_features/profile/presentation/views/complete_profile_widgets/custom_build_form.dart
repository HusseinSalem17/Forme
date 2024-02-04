import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomBuildForm extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double topPadding, bottomPadding;
  final bool optional, titleVisibility;
  final Widget child;
  const CustomBuildForm({
    super.key,
    this.optional = false,
    required this.title,
    required this.child,
    this.titleColor,
    this.bottomPadding = 4.0,
    this.topPadding = 4.0,
    this.titleVisibility = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: titleVisibility,
          child: Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: optional
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyles.textStyleBold.copyWith(
                            color: titleColor,
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
                        color: titleColor,
                        fontSize: 14.sp,
                      ),
                    )),
        ),
        child,
      ],
    );
  }
}
