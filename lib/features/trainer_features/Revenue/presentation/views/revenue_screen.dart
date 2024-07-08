import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/Revenue/presentation/views/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/trainer_features/Revenue/presentation/views/widgets/revenue_card.dart';
import 'package:forme_app/features/trainer_features/Revenue/presentation/views/widgets/trainer_card.dart';

class RevenueScreen extends StatefulWidget {
  static const routeName = '/revenue-screen';

  const RevenueScreen({super.key});

  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> weekDays = [
    //   'Mon',
    //   'Tue',
    //   'Wed',
    //   'Thu',
    //   'Fri',
    //   'Sat',
    //   'Sun'
    // ];
    final List<String> tabTitles = ['Week', 'Month', 'Year'];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CustomAppBarArrowButton(onTap: () {
                Navigator.pop(context);
              }),
              const Spacer(),
              Text(
                'Revenue',
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
              ),
              const Spacer(),
              SizedBox(width: 32.w),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTabBar(
                  tabs: tabTitles,
                  selectedIndex: _selectedIndex,
                  onTabSelected: _onTabSelected,
                ),
                RevenueCard(
                  context: context,
                  title: 'Week',
                  value: '\$ 11,250.00',
                  index: _selectedIndex,
                  spots: const [
                    FlSpot(0, 85),
                    FlSpot(1, 110),
                    FlSpot(2, 90),
                    FlSpot(3, 150),
                    FlSpot(4, 140),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.n900Black,
                            height: 3),
                      ),
                      trainerCard(
                          context,
                          'Irvin Farrell',
                          'assets/image/m.jpg',
                          'Beginner',
                          'Paypal',
                          '+ E£250.00',
                          '01:30 PM'),
                      trainerCard(
                          context,
                          'Ana Glover',
                          'assets/image/temp/Ellipse 8.png',
                          'Intermediate',
                          'Paypal',
                          '+ E£450.00',
                          '02:30 PM'),
                      // SizedBox(
                      //   height: MediaQuery.sizeOf(context).height / 3,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.vertical,
                      //     itemCount: 50,
                      //     itemBuilder: (context, index) {
                      //       return trainerCard(
                      //           context,
                      //           'Mohamed salah',
                      //           'assets/image/m.jpg',
                      //           'Beginner',
                      //           'Paypal',
                      //           '+ E£250.00',
                      //           '01:30 PM');
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
