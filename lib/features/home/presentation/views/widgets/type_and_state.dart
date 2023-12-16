import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TypeAndState extends StatelessWidget {
  final String type, state;
  final Color stateColor;
  const TypeAndState({
    super.key,
    required this.type,
    required this.state,
    this.stateColor = AppColors.p300PrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 85.w,
      // height: 18.h,
      decoration: BoxDecoration(
        color: AppColors.n20FillBodyInSmallCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              type,
              style: TextStyles.cardTextStyle,
            ),
            Container(
              width: 0.5,
              height: 9,
              color: AppColors.p300PrimaryColor,
            ),
            Text(
              state,
              style: TextStyles.cardTextStyle.copyWith(
                  color: state == 'Open'
                      ? AppColors.greenColor
                      : state == 'Close'?AppColors.redColor:AppColors.p300PrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
