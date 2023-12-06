import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_trainer_view.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/trainer_storys_view.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/widgets/trainer_app_bar.dart';

class TrainerDetailsScreen extends StatefulWidget {
  const TrainerDetailsScreen({super.key});
  static const routeName = '/Trainer-details-screen';
  @override
  State<TrainerDetailsScreen> createState() => _TrainerDetailsScreenState();
}

class _TrainerDetailsScreenState extends State<TrainerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 2,
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
                        expandedHeight: 180.h,
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
                        flexibleSpace: const FlexibleSpaceBar(
                          collapseMode: CollapseMode.none,
                          background: TrainerDetailsAppBar(),
                        ),
                        bottom: TabBar(
                            enableFeedback: true,
                            dividerColor: AppColors.p300PrimaryColor,
                            labelColor: AppColors.p300PrimaryColor,
                            unselectedLabelColor: Colors.black,
                            labelStyle: Styles.textStyleRegular.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 16.sp),
                            indicatorSize: TabBarIndicatorSize.tab,
                            isScrollable: true,
                            indicatorColor: AppColors.p300PrimaryColor,
                            tabs: const [
                              Tab(child: Text('           About          ')),
                              Tab(child: Text('       Success Story      ')),
                            ]),
                      ),
                    ];
                  },
                  body: const TabBarView(
                    children: [AboutTrainerScreen(), TrainerStorysScreen()],
                  ),
                ),
              ],
            ))));
  }
}
