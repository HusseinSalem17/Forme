import 'package:flutter/material.dart';
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
      labelColor: AppColors.p300PrimaryColor,
      unselectedLabelColor: AppColors.n900PrimaryTextColor,
      labelStyle: TextStyles.textStyleRegular
          .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
      indicatorSize: TabBarIndicatorSize.tab,
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
