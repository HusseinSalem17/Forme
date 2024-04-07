import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/sports_club/presentation/views/widgets&methods/club_trainer_card.dart';

class TrainersTab extends StatelessWidget {
  const TrainersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Text(
                  'Specialist ',
                  style: TextStyles.textStyleBold.copyWith(
                      fontSize: 14.sp, color: AppColors.n900Black),
                ),
              ),
              Text(
                '(10)',
                style: TextStyles.textStyleBold.copyWith(
                    fontSize: 14.sp, color: AppColors.primaryColor),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.w),
                      child: clubTrainerCard(context));
                }),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
