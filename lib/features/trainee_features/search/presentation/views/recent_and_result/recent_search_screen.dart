import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/tabs/search_workout_tab.dart';

class RecentSearchScreen extends StatelessWidget {
  const RecentSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Fitness GYM', 'Swimming Pool', 'Style Square'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Search',
                    style: TextStyles.textStyleSemiBold
                        .copyWith(color: AppColors.n900Black, fontSize: 16.sp),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: items.map((item) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item,
                                style: TextStyles.textStyleRegular,
                              ),
                              const Icon(
                                Icons.clear_rounded,
                                color: AppColors.n200Gray,
                              )
                            ],
                          ),
                          SizedBox(height: 16.h),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const Expanded(child: SearchWorkoutTab()),
          ],
        ),
      ),
    );
  }
}
