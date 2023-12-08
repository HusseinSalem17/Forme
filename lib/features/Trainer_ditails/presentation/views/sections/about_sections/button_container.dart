import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_botton.dart';

class ButtonContainer extends StatelessWidget {
  final String buttonTitle;
  final havePrice;
  const ButtonContainer(
      {super.key, required this.buttonTitle, this.havePrice = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.dg),
              topRight: Radius.circular(20.dg))),
      padding: EdgeInsets.all(24.h),
      child: havePrice
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price',
                      style: Styles.textStyleRegular.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      '\$150',
                      style: Styles.textStyleBold.copyWith(
                          fontSize: 14.sp, color: AppColors.p300PrimaryColor),
                    )
                  ],
                ),
                CustomAppBottom(title: buttonTitle),
              ],
            )
          : CustomAppBottom(title: buttonTitle),
    );
  }
}
