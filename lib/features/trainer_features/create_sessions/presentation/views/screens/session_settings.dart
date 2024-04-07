import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/select_package.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/small_text_field.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/text_field_container.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/two_choices.dart';

class SessionSettingsScreen extends StatefulWidget {
  const SessionSettingsScreen({super.key});

  @override
  State<SessionSettingsScreen> createState() => _SessionSettingsScreenState();
}

class _SessionSettingsScreenState extends State<SessionSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Session Settings', style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Package', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n400color)),
                  const SizedBox(height: 16),
                  const SelectPackage(
                    text1: 'Messaging Session',
                    text2: 'Voice Call Session',
                    text3: 'Video Call Session',
                    text4: 'In Person',
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.n20FillBodyInSmallCardColor, thickness: 2),
                  const SizedBox(height: 24),
                  Text('Set Session Duration and Fees', style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 8.h),
                  Text(
                    'Define how long your session will be. Default(15 minutes).',
                    style: TextStyles.textStyleRegular.copyWith(color: AppColors.n600color),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      text: 'Duration ',
                      style: TextStyles.textStyleRegular.copyWith(color: AppColors.n400color, fontSize: 14.sp, fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(Minutes)',
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.n100Gray,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const DurationTextField(),
                  SizedBox(height: 16.h),
                  const Divider(color: AppColors.n20FillBodyInSmallCardColor, thickness: 2),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      text: 'Select Target Gender ',
                      style: TextStyles.textStyleRegular.copyWith(color: AppColors.n400color, fontSize: 14.sp, fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(Multi Choice)',
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.n100Gray,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const TwoChoices(text1: 'Male', text2: 'Female', isIcon: true, isMultiChoice: true),
                  SizedBox(height: 16.h),
                  const Divider(color: AppColors.n20FillBodyInSmallCardColor, thickness: 2),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Enter Target Age', style: TextStyles.textStyleRegular.copyWith(color: AppColors.n400color, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                      Text('(Optional)', style: TextStyles.textStyleRegular.copyWith(color: AppColors.n100Gray, fontSize: 12.sp)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextField(text: 'Minimum'),
                      Icon(Icons.arrow_forward, color: AppColors.n900Black, size: 24.sp),
                      const SmallTextField(text: 'maximum'),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Divider(color: AppColors.n20FillBodyInSmallCardColor, thickness: 2),
                  SizedBox(height: 24.h),
                  Text('Client should do the following before the session starts',
                      style: TextStyles.textStyleRegular.copyWith(color: AppColors.n400color, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 16.h),
                  const SelectPackage(
                    isInput: false,
                    text1: 'Update Body Measurements',
                    text2: 'Update Preferences & Lifestyle Data',
                    text3: 'Attach Body Images',
                    text4: 'Attach Medical Reports',
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Got to Profile',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
