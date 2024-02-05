import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/tabs/my_programs_tab.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/tabs/my_sessions_tab.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/tabs/my_workout_tab.dart';

class MyServicesScreen extends StatelessWidget {
  static const routeName = '/my-services';
  const MyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            centerTitle: true,
            title: Text("My Services", style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: CustomAppBarArrowButton(
                  icon: Icons.add_circle,
                  color: AppColors.p300PrimaryColor,
                  size: 30,
                  onTap: () {},
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
