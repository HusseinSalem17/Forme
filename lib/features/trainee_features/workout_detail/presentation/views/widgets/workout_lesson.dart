import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class WorkoutLesson extends StatelessWidget {
  const WorkoutLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        width: double.maxFinite,
        height: 65.h,
        decoration: BoxDecoration(
            color: AppColors.fillColor,
            border: Border.all(color: AppColors.n40Gray, width: 1.h),
            borderRadius: BorderRadius.circular(40.dg)),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColors.n20Gray,
                    borderRadius: BorderRadius.circular(15.dg)),
                child: Center(
                  child: Text(
                    '01',
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 14.sp, color: AppColors.primaryColor),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harmony Flow Hour',
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.n900Black),
                  ),
                  Text(
                    '10:00',
                    style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset('assets/image/Icon/play.svg',width: 24.h,),
              //SvgPicture.asset('assets/image/Icon/lock-video.svg'),
            ],
          ),
        ),
      ),
    );
  }
}