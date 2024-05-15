import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'my_sessions_tab/canceled_tab.dart';
import 'my_sessions_tab/completed_tab.dart';
import 'my_sessions_tab/upcoming_tab.dart';

class MySessionsTab extends StatefulWidget {
  const MySessionsTab({super.key});

  @override
  State<MySessionsTab> createState() => _MySessionsTabState();
}

class _MySessionsTabState extends State<MySessionsTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {}); // Update the state when tab changes
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.6.h, right: 8.w, left: 8.w),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.n30StrokeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.fill,
                  controller: tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.n900Black,
                  tabs: [
                    Tab(
                      child: Text(
                        'Upcoming',
                        style: TextStyles.textStyleRegular.copyWith(
                          color: tabController.index == 0
                              ? AppColors.n900Black
                              : AppColors.n400color,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Completed',
                        style: TextStyles.textStyleRegular.copyWith(
                          color: tabController.index == 1
                              ? AppColors.s500Success
                              : AppColors.n400color,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Cancelled',
                        style: TextStyles.textStyleRegular.copyWith(
                          color: tabController.index == 2
                              ? AppColors.d500Danger
                              : AppColors.n400color,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  UpcomingTab(),
                  CompletedTab(),
                  CancelledTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
