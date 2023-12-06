import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: AppColors.n20FillBodyInSmallCardColor,
          borderRadius: BorderRadius.circular(15.dg)),
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: TextField(
          cursorColor: AppColors.p300PrimaryColor,
          keyboardType: TextInputType.multiline,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'Enter here',
            hintStyle: Styles.textStyleRegular.copyWith(fontSize: 16.sp),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
