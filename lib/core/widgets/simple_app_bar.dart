import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';

AppBar simpleAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColors.background,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyles.textStyleBold
              .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
        ),
        const Spacer(),
        SizedBox(width: 32.w),
      ],
    ),
  );
}
