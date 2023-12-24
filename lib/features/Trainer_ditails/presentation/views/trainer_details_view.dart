import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/actionsIcon.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
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
        body: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: AppColors.background,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.sizeOf(context).height / 3.8,
                  actions: actionsIcons(context),
                  flexibleSpace: const FlexibleSpaceBar(
                    collapseMode: CollapseMode.none,
                    background: TrainerDetailsAppBar(),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 20),
                    child: Container(
                      width: double.maxFinite,
                      color: AppColors.background,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: const CustomTabBar(
                          titles: ['About', 'Success Story'],
                        ),
                      ),
                    ),
                  )),
            ];
          },
          body: const TabBarView(
            children: [AboutTrainerScreen(), TrainerStorysScreen()],
          ),
        ),
      ),
    ));
  }
}
