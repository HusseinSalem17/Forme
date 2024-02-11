import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/search_workout_tab.dart';


class RecentSearchScreen extends StatelessWidget {
  const RecentSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      'Recent Search',
                      style : TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fitness GYM",
                          style: TextStyles.textStyleRegular,
                        ),
                        Icon(
                          Icons.clear_rounded,
                          color: AppColors.n200BodyContentColor,
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Swimming Pool",
                          style: TextStyles.textStyleRegular,
                        ),
                        Icon(
                          Icons.clear_rounded,
                          color: AppColors.n200BodyContentColor,
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Style Square",
                          style: TextStyles.textStyleRegular,
                        ),
                        Icon(
                          Icons.clear_rounded,
                          color: AppColors.n200BodyContentColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(child: SearchWorkoutTab()),
            ],
          )),
    );
  }
}
