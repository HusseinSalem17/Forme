import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/links_text_field.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/pick_languages.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/text_area_field.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/two_choices.dart';

class FirstPreferenceTrainer extends StatelessWidget {
  const FirstPreferenceTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<TrainerPreferenceCubit, TrainerPreferenceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell us about yourself',
                    textAlign: TextAlign.start,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextAreaField(
                      controller:
                          context.read<TrainerPreferenceCubit>().bioController,
                      hintText:
                          'Please share a brief description about yourself'),
                  SizedBox(height: 16.h),
                  const Divider(
                    color: AppColors.n40Gray,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Do you have previous experience with individuals with severe injuries?',
                    textAlign: TextAlign.start,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TwoChoices(
                    option1Text: 'Yes',
                    option2Text: 'No',
                    controller:
                        context.read<TrainerPreferenceCubit>().expInjuries,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(
                    color: AppColors.n40Gray,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Do you have previous experience with people with physical disabilities?',
                    textAlign: TextAlign.start,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TwoChoices(
                    option1Text: 'Yes',
                    option2Text: 'No',
                    controller: context
                        .read<TrainerPreferenceCubit>()
                        .physicalDisabilities,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(
                    color: AppColors.n40Gray,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'What language do you speak?',
                    textAlign: TextAlign.start,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const PickLanguages(),
                  SizedBox(height: 8.h),
                  const Divider(
                    color: AppColors.n40Gray,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Add links to your social media accounts',
                    textAlign: TextAlign.start,
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  LinksTextField(
                    controller:
                        context.read<TrainerPreferenceCubit>().facebookUrl,
                    hintText: 'Facebook (link)',
                    logo: 'facebook',
                  ),
                  SizedBox(height: 8.h),
                  LinksTextField(
                    controller:
                        context.read<TrainerPreferenceCubit>().instagramUrl,
                    hintText: 'Instagram (link)',
                    logo: 'instagram_colored',
                  ),
                  SizedBox(height: 8.h),
                  LinksTextField(
                    controller:
                        context.read<TrainerPreferenceCubit>().youtubeUrl,
                    hintText: 'Youtube (link)',
                    logo: 'youtube',
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 6.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
