import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/transitions/page_slide.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../trainee_features/profile/presentation/views/help_center/help_center.dart';
import '../../../../trainee_features/profile/presentation/views/privacy_policy.dart';
import '../../../../trainee_features/profile/presentation/views/settings_screen.dart';
import '../../../../trainee_features/profile/presentation/views/widgets/pop_up.dart';
import '../../../../trainee_features/profile/presentation/views/widgets/profile_feature.dart';
import '../../../my_services/data/my_programs_cards_model.dart';
import '../../../subscriptions/data/clients_subscriptions_cards_model.dart';
import 'screens/files/nutrition_files_screen.dart';
import 'screens/files/program_files_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/trainer_your_profile_screen.dart';

class TrainerProfileScreen extends StatefulWidget {
  const TrainerProfileScreen({super.key});
  static const routeName = '/trainer_profile-screen';

  @override
  State<TrainerProfileScreen> createState() => _TrainerProfileScreenState();
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> features = [
      'Your Profile',
      'Program files',
      'Nutrition files',
      'Reviews',
      'Payment Methods',
      'Settings',
      'Help Center',
      'Privacy Policy',
      'Log Out',
    ];

    final List<String> featuresIcons = [
      'profile_user',
      'files',
      'files',
      'reward',
      'card',
      'settings',
      'Exclamation-mark',
      'lock-video',
      'Vector',
    ];
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  'Profile',
                  style: TextStyles.textStyleBold
                      .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).height / 9,
                height: MediaQuery.sizeOf(context).height / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.dg),
                  child: Image.asset(
                    'assets/image/informa.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text('Ahmed Ramy',
                style: TextStyles.textStyleBold.copyWith(
                    fontSize: 14.sp, color: AppColors.n900Black, height: 2)),
            Container(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Divider(
                    thickness: 1.h,
                    color: AppColors.n30StrokeColor,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                                clientsSubscriptionsCardsModel.length
                                    .toString(),
                                style: TextStyles.textStyleBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.n900Black,
                                    height: 2)),
                            Text('Subscriptions',
                                style: TextStyles.textStyleRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.n900Black,
                                    height: 2)),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.n30StrokeColor,
                          thickness: 1.h,
                        ),
                        Column(
                          children: [
                            Text(myProgramsCardsModel.length.toString(),
                                style: TextStyles.textStyleBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.n900Black,
                                    height: 2)),
                            Text('  Programs  ',
                                style: TextStyles.textStyleRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.n900Black,
                                    height: 2,),),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.n30StrokeColor,
                          thickness: 1.h,
                        ),
                        Column(
                          children: [
                            Text('10',
                                style: TextStyles.textStyleBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.n900Black,
                                    height: 2)),
                            Text(
                              '  Sessions  ',
                              style: TextStyles.textStyleRegular.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.n900Black,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.h,
                    color: AppColors.n30StrokeColor,
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transformations',
                          style: TextStyles.textStyleRegular.copyWith(
                              fontSize: 16.w, color: AppColors.n900Black),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(PageSlideTransition(const TransformationsScreen()));
                          },
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyles.textStyleRegular.copyWith(
                                    fontSize: 14.w,
                                    color: AppColors.primaryColor),
                              ),
                              SvgPicture.asset(
                                  'assets/image/profile/arrow.svg'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'General',
                          style: TextStyles.textStyleSemiBold.copyWith(
                              color: AppColors.n900Black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 3),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                  children: List<Widget>.generate(9, (int index) {
                return profileFeature(featuresIcons[index], features[index],
                    () {
                  switch (index) {
                    case 0:
                      Navigator.of(context).push(PageSlideTransition(
                          const TrainerYourProfileScreen()));
                    case 1:
                      Navigator.of(context).push(
                          PageSlideTransition(const ProgramFilesScreen()));
                    case 2:
                      Navigator.of(context).push(
                          PageSlideTransition(const NutritionFilesScreen()));
                    case 3:
                      Navigator.of(context)
                          .push(PageSlideTransition(const ReviewsScreen()));

                    // case 4:
                    //   Navigator.of(context)
                    //       .push(PageSlideTransition(const MyProfile()));
                    case 5:
                      Navigator.of(context)
                          .push(PageSlideTransition(const SettingsScreen()));

                    case 6:
                      Navigator.of(context)
                          .push(PageSlideTransition(const HelpCenter(
                        filterTypes: [
                          'all',
                          'GYM',
                          'Swimming',
                          'Boxing',
                          'Running'
                        ],
                      )));
                    case 7:
                      Navigator.of(context)
                          .push(PageSlideTransition(const PrivacyPolicy()));
                    case 8:
                      popUp(context, 'Logout',
                          'Are you sure you want to log out?', 'Log Out');
                  }
                }, index != 8 ? AppColors.n900Black : AppColors.d300Danger);
              })),
            )
          ],
        ),
      ),
    ));
  }
}
