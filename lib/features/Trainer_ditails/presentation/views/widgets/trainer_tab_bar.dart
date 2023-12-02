import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class TrainerTabBar extends StatelessWidget {
  const TrainerTabBar({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: AppColors.p300PrimaryColor,
      enableFeedback: true,
      tabs: list.map((e) => Tab(text: e)).toList(),
      labelColor: AppColors.p300PrimaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: Styles.textStyleRegular
          .copyWith(fontWeight: FontWeight.w500,fontSize:16.sp),
      indicator: const TabBarGradientIndicator(gradientColor: [
        AppColors.p300PrimaryColor,
        AppColors.p300PrimaryColor
      ], indicatorWidth: 4),
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
    );
  }
}