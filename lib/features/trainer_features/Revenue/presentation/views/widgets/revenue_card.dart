import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

// ignore: must_be_immutable
class RevenueCard extends StatelessWidget {
  RevenueCard(
      {super.key,
      required this.context,
      required this.value,
      required this.title,
      required this.spots,
      required this.index});

  final BuildContext context;
  final String value;
  final String title;
  final int index;
  late List<FlSpot> spots = const [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.dg),
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 6,
              offset: const Offset(0, 0),
            ),
          ]),
      margin: EdgeInsets.only(left: 8.h, top: 24.h,right: 8.h),
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyles.textStyleMedium.copyWith(
                fontSize: 22.sp, color: AppColors.n900Black),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Text(
              index == 0
                  ? 'Amount Icome This Week'
                  : index == 1
                      ? 'Amount Icome This Month'
                      : 'Amount Icome This Year',
              style: TextStyles.textStyleRegular.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                titlesData: const FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        //getTitlesWidget: (),
                        reservedSize: 22,
                      ),
                    )),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 200,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: AppColors.primaryColor,
                    barWidth: 2.h,
                    isStrokeCapRound: true,
                    //dot section
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) {
                        return spot.x == barData.spots.length - 1;
                      },
                      getDotPainter: (spot, percent, barData, index) {
                        final radius = 4.0.dg; // Size of the dot
                        const color = AppColors.background; // Color of the dot
                        final strokeWidth = 2.0.h; // Stroke width of the dot
                        const strokeColor = AppColors
                            .primaryColor; // Stroke color of the dot

                        return FlDotCirclePainter(
                          radius: radius,
                          color: color,
                          strokeWidth: strokeWidth,
                          strokeColor: strokeColor,
                        );
                      },
                    ),
                    //area under line
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor.withOpacity(0.5),
                          AppColors.background.withOpacity(0.5)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
