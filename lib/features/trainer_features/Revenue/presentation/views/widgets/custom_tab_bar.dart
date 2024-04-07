import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.n30StrokeColor,
        borderRadius: BorderRadius.circular(10.dg),
      ),
      padding: EdgeInsets.all(4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          tabs.length,
          (index) => GestureDetector(
            onTap: () => onTabSelected(index),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Container(
                key: ValueKey<int>(selectedIndex),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? AppColors.background
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.dg),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24),
                child: Text(
                  tabs[index],
                  style: TextStyles.textStyleRegular.copyWith(
                    color: index == selectedIndex
                        ? AppColors.primaryColor
                        : AppColors.n400color,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
