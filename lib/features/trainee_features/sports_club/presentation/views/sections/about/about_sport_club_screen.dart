import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/widgets/trainer_description.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/about/sections/facilities_section.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/about/sections/trainer_section.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/widgets&methods/club_text_list.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/widgets&methods/plans_list.dart';

class AboutSportsClubTab extends StatelessWidget {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final List<String> time = [
    '00:00 - 00:00',
    '00:00 - 00:00',
    '00:00 - 00:00',
    '00:00 - 00:00',
    '00:00 - 00:00',
    '00:00 - 00:00',
    '00:00 - 00:00',
  ];
  AboutSportsClubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Description',
            style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
          ),
          const TrainerDescription(),
          Text(
            'Working Hours',
            style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
          ),
          const Divider(
            thickness: 1,
            color: AppColors.n40Gray,
          ),
          clubTextList(days, time),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              'GYM Owner',
              style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
            ),
          ),
          trainerSection(),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              'Facilities',
              style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
            ),
          ),
          facilitiesSection(),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              'Branches',
              style: TextStyles.textStyleBold.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: const SizedBox(
              height: 40,
            ),
          ),
          const PlansList(),
          const SizedBox(
            height: 150,
          ),
        ]),
      ),
    );
  }
}
