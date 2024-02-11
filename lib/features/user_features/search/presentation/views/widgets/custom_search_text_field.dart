import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextFormField(
        cursorColor: AppColors.p300PrimaryColor,
        style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 14.sp),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.background,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          hintText: 'Search..',
          hintStyle: TextStyles.textStyleRegular.copyWith(fontSize: 16.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n30StrokeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n30StrokeColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.p300PrimaryColor,
            ),
          ),
          errorMaxLines: 1,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 5.w),
            child: SvgPicture.asset('assets/image/Icon/search.svg'),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
          suffixIcon: Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 12.w),
            child: Icon(Icons.cancel_outlined, color: AppColors.p300PrimaryColor, size: 18.spMax),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
        ),
      ),
    );
  }
}
