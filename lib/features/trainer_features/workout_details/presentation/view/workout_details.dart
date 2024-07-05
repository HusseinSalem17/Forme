import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/trainer_features/workout_details/presentation/view/tabs/about_workout.dart';
import 'package:forme_app/features/trainer_features/workout_details/presentation/view/tabs/workout_clients.dart';
import 'package:forme_app/features/trainer_features/workout_details/presentation/view/tabs/workout_reviews.dart';

class WorkoutDetails extends StatefulWidget {
  static const routeName = '/workout-details';

  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          centerTitle: true,
          title: Row(
            children: [
              CustomAppBarArrowButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              Text(
                "Workout",
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   context
                  //       .read<ProfileTrainerCubit>()
                  //       .enableEditProfileScreen = true;
                  //   context
                  //       .read<ProfileTrainerCubit>()
                  //       .getTrainerProfileDetails();
                  // });
                },
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.n50dropShadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: SvgPicture.asset(
                    "assets/image/Icon/edit.svg",
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                // context
                //         .read<ProfileTrainerCubit>()
                //         .enableEditProfileScreen
                //     ? SvgPicture.asset('assets/image/Icon/success.svg')
                //     : Container(
                //         width: 32.w,
                //         height: 32.w,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(16.r),
                //           boxShadow: [
                //             BoxShadow(
                //               color:
                //                   AppColors.n50dropShadowColor.withOpacity(0.5),
                //               blurRadius: 4,
                //               offset: const Offset(0, 2),
                //             ),
                //           ],
                //         ),
                //         padding: EdgeInsets.all(4.h),
                //         child: SvgPicture.asset(
                //           "assets/image/Icon/edit.svg",
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
              ),

              //
            ],
          ),
        ),
        body: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                width: double.maxFinite,
                color: AppColors.background,
                child: const CustomTabBar(
                  titles: ['About', 'Clients', 'Reviews'],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [AboutWorkout(), WorkoutClients(), WorkoutReviews()],
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
