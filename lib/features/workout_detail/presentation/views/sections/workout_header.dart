import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_sub_header.dart';

class WorkoutDetailHeader extends StatelessWidget {
  const WorkoutDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Workout_sub_header(),
        TabBar(
            enableFeedback: true,
            dividerColor: AppColors.p300PrimaryColor,
            labelColor: AppColors.p300PrimaryColor,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyles.textStyleRegular
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicatorColor: AppColors.p300PrimaryColor,
            tabs: const [
              Tab(child: Text('    About   ')),
              Tab(child: Text('   Workout  ')),
              Tab(child: Text('   Reviews  ')),
            ]),
      ],
    );
  }
}


