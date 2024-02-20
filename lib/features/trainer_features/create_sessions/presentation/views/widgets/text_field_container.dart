import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class DurationTextField extends StatelessWidget {
  const DurationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.dg)),
        color: AppColors.background,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              cursorColor: AppColors.p300PrimaryColor,
              style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 14.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                hintText: 'Enter Duration',
                hintStyle: TextStyles.textStyleMedium.copyWith(color: AppColors.n200BodyContentColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.dg)),
                  borderSide: const BorderSide(
                    color: AppColors.n40BorderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.dg)),
                  borderSide: const BorderSide(
                    color: AppColors.p300PrimaryColor,
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.0.w, right: 5.w),
                  child: Icon(Icons.access_time, color: AppColors.n80NavColor, size: 20.sp),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 10, minHeight: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
