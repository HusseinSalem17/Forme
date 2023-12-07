import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

import '../../../../../core/utils/text_styles_20231128011153.dart';

class HeaderText extends StatelessWidget {
  final String title, subtitle;

  const HeaderText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Text(
            title,
            style: TextStyles.headerStyle
                .copyWith(color: AppColors.n900PrimaryTextColor),
          ),
        ),
        SizedBox(
          width: 300,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.descriptionStyle,
          ),
        ),
      ],
    );
  }
}
