import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/widgets/custom_gesture_detector_row.dart';
import '../../../../../../core/transitions/page_slide.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import 'trainer_your_profile/complete_verification_screen.dart';
import 'trainer_your_profile/languages_screen.dart';
import 'trainer_your_profile/edit_profile.dart';
import 'trainer_your_profile/social_media_links_screen.dart';

class TrainerYourProfileScreen extends StatelessWidget {
  const TrainerYourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String textId = 'hussein_salem17';
    return Scaffold(
      appBar: simpleAppBar(
        context,
        'Your Profile',
      ),
      body: Column(
        children: [
          Container(
            height: 48.h,
            width: MediaQuery.of(context).size.width,
            color: AppColors.n20Gray,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/image/Icon/hash.svg',
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Trainer ID: ',
                          style: TextStyles.textStyleRegular.copyWith(
                              color: AppColors.n600color,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: textId,
                              style: TextStyles.textStyleSemiBold.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
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
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height - 50.h),
                          content: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/image/Icon/correct-icon.svg'),
                              SizedBox(
                                width: 8.0.w,
                              ),
                              Text('Trainer ID Copied successfully.',
                                  style: TextStyles.textStyleSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.n400color)),
                            ],
                          ),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.dg),
                                  bottomRight: Radius.circular(10.dg))),
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
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
            child: Column(
              children: [
                Text(
                  'Retrieve your trainer ID from your profile or simply click the copy icon above, then share it through your personal page to showcase clients who have chosen you as their coach within the club.',
                  style: TextStyles.textStyleRegular.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 37.h,
                ),
                CustomGestureDetectorRow(
                    title: "Edit Profile",
                    imageAddress: 'assets/image/profile/profile_user.svg',
                    onTap: () {
                      Navigator.of(context)
                          .push(PageSlideTransition(const MyProfileTrainer()));
                    }),
                const Divider(
                  color: AppColors.n20Gray,
                ),
                CustomGestureDetectorRow(
                    title: "Languages",
                    imageAddress: 'assets/image/profile/languages.svg',
                    onTap: () {
                      Navigator.of(context).push(
                          PageSlideTransition(const LanguagesSearchScreen()));
                    }),
                const Divider(
                  color: AppColors.n20Gray,
                ),
                CustomGestureDetectorRow(
                    title: "Social Media Links",
                    imageAddress: 'assets/image/profile/social-media.svg',
                    onTap: () {
                      Navigator.of(context).push(
                          PageSlideTransition(const SocialMediaLinksScreen()));
                    }),
                const Divider(
                  color: AppColors.n20Gray,
                ),
                CustomGestureDetectorRow(
                    title: "Complete Verification",
                    imageAddress: 'assets/image/Icon/verified_black.svg',
                    onTap: () {
                      Navigator.of(context).push(PageSlideTransition(
                          const CompleteVerificationScreen()));
                    }),
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
