import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/actionsIcon.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/features/trainee_features/reviews/presentation/views/reviews_section.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/gallery_tab.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/about/about_sport_club_screen.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/trainers_tab.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/sections/workout_header.dart';

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
                          automaticallyImplyLeading: false,
                          expandedHeight:
                              MediaQuery.sizeOf(context).height / 1.8,
                          actions: actionsIcons(context),
                          flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.none,
                              background: Image.asset(
                                'assets/image/temp/Header1.png',
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              )),
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(
                                MediaQuery.sizeOf(context).height / 5),
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
                      AboutSportsClubTab(),
                      const TrainersTab(),
                      const GalleryTab(),
                      const ReviewsSection(
                        type: 'club',
                      )
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
