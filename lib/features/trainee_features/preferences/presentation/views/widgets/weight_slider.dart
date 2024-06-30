import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:wheel_slider/wheel_slider.dart';
// import 'package:wheel_slider/wheel_slider.dart';

class WeightSlider extends StatefulWidget {
  const WeightSlider({super.key});

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  int _weightValue = 65;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(_weightValue.toString(),
                style: TextStyles.textStyleMedium
                    .copyWith(fontSize: 88.sp, color: AppColors.primaryColor)),
            Padding(
              padding: EdgeInsets.only(bottom: 22.h),
              child: Text('kg',
                  textAlign: TextAlign.end,
                  style: TextStyles.textStyleMedium.copyWith(
                      fontSize: 14.sp, color: AppColors.primaryColor)),
            ),
          ],
        ),
        WheelSlider(
          totalCount: 500,
          initValue: 65,
          lineColor: AppColors.primaryColor,
          onValueChanged: (val) {
            setState(() {
              _weightValue = val;
            });
            debugPrint(_weightValue.toString());
          },
          hapticFeedbackType: HapticFeedbackType.heavyImpact,
          showPointer: false,
        ),
      ],
    );
  }
}
