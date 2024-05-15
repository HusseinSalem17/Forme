import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.titles,
  });

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      enableFeedback: true,
      labelPadding: EdgeInsets.zero,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.n900Black,
      labelStyle: TextStyles.textStyleRegular
          .copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.primaryColor,
      tabs: List<Widget>.generate(
        titles.length,
        (int index) {
          return Tab(child: Text(titles[index]));
        },
      ),
    );
  }
}
