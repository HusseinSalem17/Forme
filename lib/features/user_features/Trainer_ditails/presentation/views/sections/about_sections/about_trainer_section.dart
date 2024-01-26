import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/data/models/trainer_icon_model.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/presentation/views/widgets/trainer_description.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/presentation/views/widgets/trainer_icon.dart';

class AboutTrainer extends StatelessWidget {
  const  AboutTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                4,
                (int index) => TrainerIcon(model: traineesIconData[index]),
              ),
            ),
          ),
          const TrainerDescription(),
          Text(
            'Programs',
            style: TextStyles.textStyleBold.copyWith(
                fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
