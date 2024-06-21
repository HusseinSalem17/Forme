import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/features/trainee_features/Payment/presentation/view/ereceipt_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/trainee_home_screen_bottom_nav.dart';

class CongratulationScreen extends StatelessWidget {
  static const routeName = '/Congratulation-screen';

  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            CustomAppBarArrowButton(onTap: () {
              Navigator.of(context)
                  .push(PageSlideTransition(const TraineeHomeScreenBottomNav()));
            }),
          ]),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/image/congratulations.png'),
                      Text(
                        'Congratulations!',
                        style: TextStyles.textStyleBold.copyWith(
                            fontSize: 22.sp, color: AppColors.n900Black),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'You have successfully made payment and enrolled the workout activity.',
                        style: TextStyles.textStyleRegular
                            .copyWith(fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 140.h,
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
            )
          ],
        ));
  }
}
