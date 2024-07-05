import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/create_session.dart';

import 'tabs/my_programs_tab.dart';
import 'tabs/my_sessions_tab.dart';
import 'tabs/my_workout_tab.dart';

class MyServicesScreen extends StatelessWidget {
  static const routeName = '/my-services';
  final int initialIndex;

  const MyServicesScreen({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: initialIndex,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            centerTitle: true,
            title: Text(
              "My Services",
              style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: CustomAppBarArrowButton(
                  icon: Icons.add_circle,
                  color: AppColors.primaryColor,
                  size: 30,
                  onTap: () {
                    Navigator.of(context).push(
                      PageSlideTransition(const CreateSessionScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(40.h),
                child: Container(
                  width: double.maxFinite,
                  color: AppColors.background,
                  child: const CustomTabBar(
                    titles: ['My Programs', 'My Workouts', 'My Sessions'],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MyProgramsTab(),
                    MyWorkoutTab(),
                    MySessionsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}