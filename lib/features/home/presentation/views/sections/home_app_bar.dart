import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:forme_app/features/home/presentation/views/widgets/map_popub_menu.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: Styles.textStyleRegular.copyWith(fontSize: 14.sp)),
            Padding(
              padding: EdgeInsets.only(top:4.h,bottom: 16.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MapPopubMenu(),
                  SvgPicture.asset('assets/image/Icon/alarm.svg')
                ],
              ),
            ),
            //search text field

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextField(),
                Container(
                  height: 40.h,
                  width: 46.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.dg),
                      color: AppColors.p300PrimaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/image/Icon/filter.svg',
                      height: 6.h,
                      width: 14.w,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}