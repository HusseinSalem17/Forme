import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/widgets/gender_chech_button.dart';

Column selectGenderSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Select Target Gender',
              style: TextStyles.textStyleSemiBold
                  .copyWith(fontSize: 14.sp, color: AppColors.n400, height: 2),
            ),
            TextSpan(
              text: ' (Multi select)',
              style: TextStyles.textStyleRegular
                  .copyWith(fontSize: 12.sp, color: AppColors.n400),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenderCheckButton(
            icon: 'male',
            gender: 'Male',
            isChecked: true, // Set initial state
            onChanged: (bool isChecked) {
              debugPrint('male checked $isChecked');
              //to do
            },
          ),
          GenderCheckButton(
            icon: 'female',
            gender: 'Female',
            isChecked: false,
            onChanged: (bool isChecked) {
              debugPrint('female checked $isChecked');
            },
          ),
        ],
      ),
    ],
  );
}
