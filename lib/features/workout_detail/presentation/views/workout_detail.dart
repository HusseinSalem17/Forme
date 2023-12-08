import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_sections/button_container.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/trainer_storys_view.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/about_tab/workout_about_tab.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_header.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_review_tab.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_tab.dart';

class WorkOutDetail extends StatefulWidget {
  static const routeName = '/Workout-details-screen';
  const WorkOutDetail({super.key});

  @override
  State<WorkOutDetail> createState() => _WorkOutDetailState();
}

class _WorkOutDetailState extends State<WorkOutDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
                body: Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (_, __) {
                    return <Widget>[
                      SliverAppBar(
                          elevation: 1.5,
                          backgroundColor: AppColors.background,
                          pinned: true,
                          expandedHeight: 400.h,
                          actions: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: CustomAppBarArrowButton(
                                onTap: () {},
                              ),
                            ),
                            const Spacer(),
                            CustomAppBarArrowButton(
                                onTap: () {}, icon: Icons.share),
                            Padding(
                              padding: EdgeInsets.only(right: 20.h),
                              child: CustomAppBarArrowButton(
                                  onTap: () {}, icon: Icons.favorite_border),
                            )
                          ],
                          flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.none,
                              background: Image.asset(
                                'assets/image/temp/Header1.png',
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              )),
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(150.h),
                            child: Container(
                              width: double.maxFinite,
                              color: AppColors.background,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24.0.w),
                                child: const WorkoutDetailHeader(),
                              ),
                            ),
                          )),
                    ];
                  },
                  body: const TabBarView(
                    children: [WorkoutAboutTab(), WorkoutTab(),WorkoutReviewTab()],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonContainer(
                    buttonTitle: 'Book Now',
                    havePrice: true,
                  ),
                )
              ],
            ))));
  }
}