import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

GestureDetector trainerCard(String icon, String title, BuildContext context, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        width: MediaQuery.sizeOf(context).width / 2 - 40.w,
        decoration: BoxDecoration(
          color: AppColors.n20FillBodyInSmallCardColor,
          border: Border.all(width: 1.sp, color: AppColors.border30),
          borderRadius: BorderRadius.circular(8.dg),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Column(
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppColors.n300Color,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                'assets/image/Icon/$icon.svg',
                height: 40.h,
                width: 40.h,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
            )
          ],
        )),
  );
}
