import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

GestureDetector trainerComponentIcon(
      String icon, String title, BuildContext context, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 52.h,
              width: 52.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1.sp, color: AppColors.border30),
                borderRadius: BorderRadius.circular(50.dg),
                color: AppColors.n20FillBodyInSmallCardColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.n50dropShadowColor.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10.h),
              child: SvgPicture.asset('assets/image/Icon/$icon.svg'),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp, color: AppColors.n900PrimaryTextColor),
            )
          ],
        ),
      ),
    );
  }