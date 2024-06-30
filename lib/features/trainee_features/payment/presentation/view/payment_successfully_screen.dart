import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';

import 'package:forme_app/features/trainee_features/payment/presentation/view/widgets/payment_successfully_body.dart';

import '../../../../../core/widgets/custom_app_button.dart';
import '../../../home/presentation/views/trainee_home_screen_bottom_nav.dart';
import 'ereceipt_screen.dart';

class PaymentSuccessfullyScreen extends StatelessWidget {
  static const routeName = '/payment-successfully-screen';

  const PaymentSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          CustomAppBarArrowButton(onTap: () {
            Navigator.of(context).push(PageSlideTransition(const TraineeHomeScreenBottomNav()));
          }),
        ]),
      ),
      body: Stack(
        children: [
          const PaymentSuccessfullyBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.sizeOf(context).height / 5,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppButton(
                        title: 'View E-Receipt',
                        onTap: () {
                          Navigator.of(context)
                              .push(PageSlideTransition(EReceiptScreen()));
                        }),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(PageSlideTransition(const TraineeHomeScreenBottomNav()));
                        },
                        child: Text('Go to Home',
                            style: TextStyles.textStyleRegular.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.primaryColor)))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
