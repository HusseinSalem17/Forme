import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/custom_build_form.dart';

class TextArea extends StatelessWidget {
  final String title;
  final Color titleColor;
  final TextEditingController? controller;
  const TextArea({
    super.key,
    required this.title,
    this.titleColor = AppColors.n400,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
        title: title,
        titleColor: titleColor,
        child: Container(
          height: MediaQuery.sizeOf(context).height / 4.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: AppColors.background,
              border: Border.all(color: AppColors.n40BorderColor, width: 1),
              borderRadius: BorderRadius.circular(4.dg)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: TextField(
              controller: controller,
              style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              cursorColor: AppColors.p300PrimaryColor,
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Enter here',
                hintStyle:
                    TextStyles.textStyleRegular.copyWith(fontSize: 14.sp),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ));
  }
}
