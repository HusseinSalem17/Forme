import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/widgets/cancellation_radio.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/text_area_field.dart';

class CancellationScreen extends StatelessWidget {
  const CancellationScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Session: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Hussein Salem',
                style: TextStyle(
                  color: AppColors.p300PrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please select a reason for cancellation: ",
                    style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const CancellationRadio(),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Note to Trainer',
                    style: TextStyles.textStyleSemiBold.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const TextAreaField(hintText: 'Enter here'),
                  SizedBox(
                    height: 120.h,
                  ),
                ],
              ),
            ),
          ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonContainer(
                      buttonTitle: 'Cancel Session',
                      color: AppColors.d300Danger,
                      onTap: () {},
                    ),
                  ),
        ],
      ),
    );
  }
}
