import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentSuccessfullyBody extends StatelessWidget {
  const PaymentSuccessfullyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Center(
        child: Container(
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 142,
                height: 142,
                decoration: BoxDecoration(
                    color: AppColors.p300PrimaryColor,
                    borderRadius: BorderRadius.circular(71)),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/image/Icon/correct.svg',
                    width: 61.99,
                    height: 43.43,
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Text(
                'Payment Successful!',
                style: TextStyles.heading4Bold,
              ),
              SizedBox(
                height: 7.5.h,
              ),
              Text(
                'You have successfully booked appointment with',
                style: TextStyles.textStyleRegular.copyWith(
                  color: AppColors.n70HintColor,
                ),
              ),
              Text(
                'Coach (name)',
                style: TextStyles.textStyleSemiBold.copyWith(
                  color: AppColors.neutralsN9,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  buildRowIcons(
                    'User (name)',
                    'assets/image/Icon/profile.svg',
                    height: 22.33.h,
                    width: 20.w,
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  buildRowIcons('\$20', 'assets/image/Icon/dollar.svg')
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  buildRowIcons(
                      '04 Oct, 2023', 'assets/image/Icon/calendar.svg'),
                  const SizedBox(
                    width: 97,
                  ),
                  buildRowIcons('07:00 AM', 'assets/image/Icon/clock.svg'),
                ],
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRowIcons(
  String text,
  String imgPath, {
  double? height,
  double? width,
}) {
  return Row(
    children: [
      SvgPicture.asset(
        imgPath,
        colorFilter: const ColorFilter.mode(
          AppColors.p300PrimaryColor,
          BlendMode.srcIn,
        ),
        width: width,
        height: height,
      ),
      SizedBox(
        width: 8.w,
      ),
      Text(
        text,
        style: TextStyles.textStyleSemiBold.copyWith(
          fontSize: 14,
          color: AppColors.neutralsN9,
        ),
      )
    ],
  );
}
