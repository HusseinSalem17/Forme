import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/screens/clients_subscriptions.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/screens/your_clubs.dart';
import '../../../../../core/transitions/page_slide.dart';
import 'widgets/custom_gesture_detector_row.dart';

class SubscriptionsScreen extends StatelessWidget {
  static const String routeName = '/subscriptions_route';
  final String textId;
  const SubscriptionsScreen({super.key, this.textId = 'hussein_salem17'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: simpleAppBar(
        context,
        'Club Subscriptions',
      ),
      body: Column(
        children: [
          Container(
            height: 48.h,
            width: MediaQuery.of(context).size.width,
            color: AppColors.n20Gray,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/Icon/hash.svg', color: AppColors.n900Black),
                      SizedBox(
                        width: 16.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Trainer ID: ',
                          style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: textId,
                              style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('assets/image/Icon/copy.svg'),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: textId));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 50.h),
                          content: Row(
                            children: [
                              SvgPicture.asset('assets/image/Icon/correct-icon.svg'),
                              SizedBox(
                                width: 8.0.w,
                              ),
                              Text('Trainer ID Copied successfully.', style: TextStyles.textStyleSemiBold.copyWith(fontSize: 12.sp, color: AppColors.n400color)),
                            ],
                          ),
                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.dg), bottomRight: Radius.circular(10.dg))),
                          duration: const Duration(seconds: 2),
                          dismissDirection: DismissDirection.up,
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                          closeIconColor: AppColors.n100Gray,
                          backgroundColor: AppColors.p75PrimaryColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Text(
                  'Retrieve your trainer ID from your profile or simply click the copy icon above, then share it through your personal page to showcase clients who have chosen you as their coach within the club.',
                  style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomGestureDetectorRow(
                    title: "Your Clubs",
                    imageAddress: 'assets/image/Icon/club.svg',
                    onTap: () {
                      Navigator.of(context).push(PageSlideTransition(const YourClubsScreen()));
                    }),
                const Divider(
                  color: AppColors.n20Gray,
                ),
                CustomGestureDetectorRow(
                  title: "Clients Subscriptions",
                  imageAddress: 'assets/image/Icon/users.svg',
                  onTap: () {
                    Navigator.of(context).push(PageSlideTransition(const ClientsSubscriptionsScreen()));
                  },
                ),
                const Divider(
                  color: AppColors.n20Gray,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
