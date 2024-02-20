import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TextFieldWithCustomLabel extends StatelessWidget {
  const TextFieldWithCustomLabel({super.key, required this.isEnabled});
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.dg)),
        border: Border.all(
          color: isEnabled ? AppColors.p300PrimaryColor : AppColors.n20FillBodyInSmallCardColor,
        ),
        color: isEnabled ? AppColors.background : AppColors.n20FillBodyInSmallCardColor,
      ),
      child: TextFormField(
        enabled: isEnabled,
        cursorColor: AppColors.p300PrimaryColor,
        style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 14.sp),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 8.w, right: 16.w, top: 4.h, bottom: 4.h),
          labelText: 'Price (EGP)',
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyles.textStyleMedium.copyWith(
            color: isEnabled ? AppColors.n200BodyContentColor : AppColors.n100Color,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelStyle: TextStyles.textStyleMedium.copyWith(color: AppColors.p300PrimaryColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
          hintStyle: TextStyles.textStyleRegular.copyWith(color: AppColors.n100Color, fontSize: 12.sp),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
