import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class SliderPriceRange extends StatefulWidget {
  const SliderPriceRange({super.key});

  @override
  State<SliderPriceRange> createState() => _SliderPriceRangeState();
}

class _SliderPriceRangeState extends State<SliderPriceRange> {
  RangeValues _values = const RangeValues(0, 300);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' \$${_values.start.round()}',
                style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 16.sp),
              ),
              Text(
                ' \$${_values.end.round()}',
                style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 16.sp),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.dg),
            ),
            child: RangeSlider(
              activeColor: AppColors.p300PrimaryColor,
              inactiveColor: AppColors.p50PrimaryColor,
              values: _values,
              min: 0,
              max: 300,
              onChanged: (RangeValues values) {
                setState(() {
                  _values = values;
                });
              },
              labels: RangeLabels(
                ' \$${_values.start.round()}',
                ' \$${_values.end.round()}',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
