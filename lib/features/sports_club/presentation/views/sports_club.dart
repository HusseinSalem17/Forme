import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/sports_club/presentation/views/sections/about/about_sport_club_screen.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_header.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_review_tab.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_tab.dart';

class SportsClubScreen extends StatelessWidget {
  static const routeName = '/sports-club-screen';
  const SportsClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
                body: Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (_, __) {
                    return <Widget>[
                      SliverAppBar(
                          backgroundColor: AppColors.background,
                          pinned: true,
                          expandedHeight:
                              MediaQuery.sizeOf(context).height / 1.8,
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
                            preferredSize: Size.fromHeight(140.h),
                            child: Container(
                              width: double.maxFinite,
                              color: AppColors.background,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0.w),
                                child: const WorkoutDetailHeader(
                                  titles: [
                                    'about',
                                    'Trainers',
                                    'Gallery',
                                    'Reviews'
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      AboutSportsClubScreen(),
                      WorkoutTab(),
                      WorkoutTab(),
                      WorkoutReviewTab()
                    ],
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
