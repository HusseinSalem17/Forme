import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      'program',
      'workout',
      'sessions',
      'subscriptions',
      'payment',
      'revenue'
    ];
    final List<String> titles = [
      'Programs',
      'Workouts',
      'Sessions',
      'Club\nSubscriptions',
      'Payment\nMethods',
      'Revenue'
    ];
    final List<String> cardIcons = [
      'Programs',
      'Workouts',
      'Sessions',
      'Club\nSubscriptions',
    ];
    final List<String> cardTitles = [
      'Add Programs',
      'Add Workout',
      'Add Sessions',
      'Add Transformation',
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.n20FillBodyInSmallCardColor,
                  border: Border.all(width: 1.sp, color: AppColors.border30),
                  borderRadius: BorderRadius.circular(16.dg),
                ),
                padding: EdgeInsets.all(24.h),
                child: Wrap(
                  spacing: 8.h,
                  runSpacing: 16.0.h,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List<Widget>.generate(
                    icons.length,
                    (int index) {
                      return trainerComponentIcon(
                          icons[index], titles[index], context, () {
                        switch (index) {
                          case 0: //programs
                          case 1: //Workouts
                          case 2: //Sessions
                          case 3: //Club Subscriptions
                          case 4: //Payment Methods
                          case 5: //Revenue
                        }
                      });
                    },
                  ),
                ),
              ),
              Wrap(
                spacing: 8.h,
                runSpacing: 16.0.h,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List<Widget>.generate(
                  cardIcons.length,
                  (int index) {
                    return trainerCard(cardIcons[index], cardTitles[index], () {
                      switch (index) {
                        case 0: //programs
                        case 1: //Workouts
                        case 2: //Sessions
                        case 3: //Club Subscriptions
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector trainerCard(
      String icon, String title, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.n20FillBodyInSmallCardColor,
            border: Border.all(width: 1.sp, color: AppColors.border30),
            borderRadius: BorderRadius.circular(16.dg),
          ),
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              SvgPicture.asset('assets/image/Icon/$icon.svg'),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              )
            ],
          )),
    );
  }

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
              padding: EdgeInsets.all(8.h),
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
}
