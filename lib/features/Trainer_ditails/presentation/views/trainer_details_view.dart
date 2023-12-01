import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/widgets/trainer_app_bar.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class TrainerDetailsScreen extends StatelessWidget {
  static const routeName = '/Trainer-details-screen';
  const TrainerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List list = ["           About           ", "       Success Story      "];

    return DefaultTabController(
      length: list.length,
      child: MaterialApp(
          home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 200),
              child: Column(
                children: [
                  const TrainerDetailsAppBar(),
                  TabBar(
                    dividerColor: AppColors.p300PrimaryColor,
                    enableFeedback: true,
                    tabs: list.map((e) => Tab(text: e)).toList(),
                    labelColor: AppColors.p300PrimaryColor,
                    unselectedLabelColor: Colors.black,
                    labelStyle: Styles.textStyleRegular
                        .copyWith(fontWeight: FontWeight.w500,fontSize:18.sp),
                    indicator: const TabBarGradientIndicator(gradientColor: [
                      AppColors.p300PrimaryColor,
                      AppColors.p300PrimaryColor
                    ], indicatorWidth: 4),
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(children: []),
        ),
      )),
    );
  }
}

// class TabScreen extends StatelessWidget {
//   final String title;

//   TabScreen({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
// TabBarView(
//   controller: _tabController,
//   children: [
//     // Add your tab content widgets here
//     TabScreen(title: 'Tab 1'),
//     TabScreen(title: 'Tab 2'),
//     TabScreen(title: 'Tab 3'),
//   ],
// ),
// TabBar(
//   controller: _tabController,
//   tabs: [
//     Tab(icon: Icon(Icons.tab)),
//     Tab(icon: Icon(Icons.tab)),
//     Tab(icon: Icon(Icons.tab)),
//   ],
// ),
