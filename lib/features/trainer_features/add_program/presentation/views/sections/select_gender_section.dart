import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/widgets/gender_chech_button.dart';

class SelectGenderSection extends StatefulWidget {
  final void Function(String) onTap;

  const SelectGenderSection({Key? key, required this.onTap}) : super(key: key);

  @override
  _SelectGenderSectionState createState() => _SelectGenderSectionState();
}

class _SelectGenderSectionState extends State<SelectGenderSection> {
  bool isMaleChecked = false;
  bool isFemaleChecked = false;

  void _onGenderChanged() {
    if (isMaleChecked && isFemaleChecked) {
      widget.onTap('both');
    } else if (isMaleChecked) {
      widget.onTap('male');
    } else if (isFemaleChecked) {
      widget.onTap('female');
    } else {
      widget.onTap('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Select Target Gender',
                style: TextStyles.textStyleSemiBold.copyWith(
                    fontSize: 14.sp, color: AppColors.n400, height: 2),
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
              isChecked: isMaleChecked,
              onChanged: (bool isChecked) {
                setState(() {
                  isMaleChecked = isChecked;
                  _onGenderChanged();
                });
              },
            ),
            GenderCheckButton(
              icon: 'female',
              gender: 'Female',
              isChecked: isFemaleChecked,
              onChanged: (bool isChecked) {
                setState(() {
                  isFemaleChecked = isChecked;
                  _onGenderChanged();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
