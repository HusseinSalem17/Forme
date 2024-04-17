
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/sports_club/data/models/club_icon_model.dart';

Column clubIcon(ClubIconModel model) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.h,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.dg),
              color: AppColors.n20Gray),
          child: SvgPicture.asset('assets/image/Icon/${model.icon}.svg'),
        ),
        Text(model.title,
            style: TextStyles.textStyleRegular.copyWith(
                fontSize: 15.sp, color: AppColors.n900Black))
      ],
    );
  }