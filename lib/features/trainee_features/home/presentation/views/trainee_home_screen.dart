import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/trainee_features/featured/presentation/featured_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/special_programs_bloc/special_programs_bloc.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/featured_workouts.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/nearby_sports_club.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/top_trainers_list.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class TraineeHomeScreen extends StatefulWidget {
  const TraineeHomeScreen({super.key});

  @override
  State<TraineeHomeScreen> createState() => _TraineeHomeScreenState();
}

class _TraineeHomeScreenState extends State<TraineeHomeScreen> {
  @override
  void initState() {
    context.read<TraineeHomeBloc>().add(GetTopTrainers());
    context.read<SpecialProgramsBloc>().add(GetSpecialPrograms());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch top trainers when the screen is loaded

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomHomeAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TopTrainersList(
                  onTap: () {
                    Navigator.of(context).push(
                      PageSlideTransition(
                        const FeaturedScreen(
                          featureType: "Top trainer",
                          filterTypes: [
                            'all',
                            'GYM',
                            'Swimming',
                            'Boxing',
                            'Running'
                          ],
                        ),
                      ),
                    );
                  },
                ),
                 SpecialPrograms(onTap: () {}),
                // FeaturedWorkouts(onTap: () {}),
              ],
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 24.w,
          //       vertical: 16.h,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           'Nearby Sports Club',
          //           style: TextStyles.textStyleBold.copyWith(
          //             fontWeight: FontWeight.w600,
          //             fontSize: 14.sp,
          //             color: AppColors.n900Black,
          //           ),
          //         ),
          //         GestureDetector(
          //           // onTap: onTap,
          //           child: Text(
          //             'See all',
          //             style: TextStyles.textStyleRegular.copyWith(
          //               fontWeight: FontWeight.w400,
          //               fontSize: 14.sp,
          //               color: AppColors.secondaryColor,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // NearbySpotsClub(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       PageSlideTransition(
          //         const FeaturedScreen(
          //           featureType: "Special Offers",
          //           filterTypes: [
          //             'all',
          //             'GYM',
          //             'Swimming',
          //             'Boxing',
          //             'Running'
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
