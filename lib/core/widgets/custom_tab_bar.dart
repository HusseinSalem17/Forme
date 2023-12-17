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
      labelColor: AppColors.p300PrimaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyles.textStyleRegular
          .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      indicatorColor: AppColors.p300PrimaryColor,
      tabs: List<Widget>.generate(
        titles.length,
        (int index) {
          return Tab(child: Text(titles[index]));
        },
      ),
    );
  }
}