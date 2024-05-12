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
          color: isEnabled ? AppColors.primaryColor : AppColors.n20Gray,
        ),
        color: isEnabled ? AppColors.background : AppColors.n20Gray,
      ),
      child: TextFormField(
        enabled: isEnabled,
        cursorColor: AppColors.primaryColor,
        style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black, fontSize: 14.sp),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 8.w, right: 16.w, top: 4.h, bottom: 4.h),
          labelText: 'Price (EGP)',
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyles.textStyleMedium.copyWith(
            color: isEnabled ? AppColors.n200Gray : AppColors.n100Gray,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelStyle: TextStyles.textStyleMedium.copyWith(color: AppColors.primaryColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
          hintStyle: TextStyles.textStyleRegular.copyWith(color: AppColors.n100Gray, fontSize: 12.sp),
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
