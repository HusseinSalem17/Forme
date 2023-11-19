import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import '../../../../core/utils/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: 25.5.w),
        child: Text(
          'Skip',
          style: Styles.descriptionStyle.copyWith(
            color: AppColors.p300PrimaryColor,
          ),
        ),
      ),
    );
  }
}
