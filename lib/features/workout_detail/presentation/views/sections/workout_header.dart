import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home/presentation/views/widgets/card_review_section.dart';

class WorkoutDetailHeader extends StatelessWidget {
  const WorkoutDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 26.h,
        ),
        const CardReviewSection(),
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Pulse Fitness Center',
            style: Styles.textStyleMedium.copyWith(
                fontSize: 16.sp, color: AppColors.n900PrimaryTextColor),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/image/personicon.svg'),
            SizedBox(width: 6.w),
            Text(
              'Ahmed Ramy',
              style: Styles.cardTextStyle.copyWith(
                color: AppColors.n200BodyContentColor,
                fontSize: 11.sp,
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/image/Icon/PlayBorder.svg'),
            SizedBox(width: 6.w),
            Text(
              '10 Workout',
              style: Styles.cardTextStyle.copyWith(
                color: AppColors.n200BodyContentColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        TabBar(
            enableFeedback: true,
            dividerColor: AppColors.p300PrimaryColor,
            labelColor: AppColors.p300PrimaryColor,
            unselectedLabelColor: Colors.black,
            labelStyle: Styles.textStyleRegular
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicatorColor: AppColors.p300PrimaryColor,
            tabs: const [
              Tab(child: Text('    About   ')),
              Tab(child: Text('   Workout  ')),
              Tab(child: Text('   Reviews  ')),
            ]),
      ],
    );
  }
}
