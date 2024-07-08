import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/Revenue/presentation/views/revenue_screen.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/Transformations_screen.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/add_program.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/add_workout.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/create_session.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/widgets/data_container.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/widgets/trainer_card.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/widgets/trainer_component_icon.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/my_services_screen.dart';

import '../../../../../core/utils/text_styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      'program',
      'workout',
      'sessions',
      'subscriptions',
      'payment',
      'revenue'
    ];
    final List<String> titles = [
      'Programs',
      'Workouts',
      'Sessions',
      'Club\nSubscriptions',
      'Cards',
      'Revenue'
    ];
    final List<String> cardIcons = [
      'program',
      'workout',
      'sessions',
      'SuccessStory',
    ];
    final List<String> cardTitles = [
      'Add Program',
      'Add Workout',
      'Add Session',
      'Add Transformation',
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 14.h,),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height / 18,
                    height: MediaQuery.sizeOf(context).height / 18,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32.dg),
                      child: Image.asset(
                        'assets/image/temp/Frame1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 26.dg,
                  //   backgroundColor: AppColors.n50BackgroundColor,
                  //   child: Image.asset(
                  //     "assets/image/temp/Frame1.png",
                  //   ),
                  // ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text('Hi, Ahmed Ramy',
                      style: TextStyles.textStyleRegular
                          .copyWith(color: AppColors.n900Black)),
                  const Spacer(),
                  SvgPicture.asset('assets/image/Icon/alarm_icon.svg')
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),

                child:
              Container(
                decoration: BoxDecoration(
                  color: AppColors.n20Gray,
                  border: Border.all(width: 1.sp, color: AppColors.border30),
                  borderRadius: BorderRadius.circular(16.dg),
                ),
                padding: EdgeInsets.all(24.h),
                child: Wrap(
                  spacing: 8.h,
                  runSpacing: 16.0.h,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List<Widget>.generate(
                    icons.length,
                    (int index) {
                      return trainerComponentIcon(
                          icons[index], titles[index], context, () {
                        switch (index) {
                          case 0:
                            {
                              BlocProvider.of<TrainerHomeBloc>(context)
                                  .currentIndex = 1;
                              Navigator.of(context).push(
                                  PageSlideTransition(const MyServicesScreen(
                                initialIndex: 0,
                              )));
                            }
                          case 1: //Workouts
                          case 2: //Sessions
                          case 3: //Club Subscriptions
                          case 4: //Payment Methods
                          case 5:
                            Navigator.of(context).push(
                                PageSlideTransition(const RevenueScreen()));
                        }
                      });
                    },
                  ),
                ),
              ),),
              Wrap(
                spacing: 16.h,
                runSpacing: 16.0.h,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List<Widget>.generate(
                  cardIcons.length,
                  (int index) {
                    return trainerCard(
                        cardIcons[index], cardTitles[index], context, () {
                      switch (index) {
                        case 0:
                          Navigator.of(context).push(
                              PageSlideTransition(const AddProgramScreen()));
                        case 1:
                          Navigator.of(context).push(
                              PageSlideTransition(const AddWorkoutScreen()));
                        case 2:
                          Navigator.of(context).push(
                              PageSlideTransition(const CreateSessionScreen()));
                        case 3:
                          Navigator.of(context).push(PageSlideTransition(
                              const TransformationsScreen()));
                      }
                    });
                  },
                ),
              ),
              dataContainer('Total Views', '2.5K', 'This Month Visits', '1.5K'),
              dataContainer('Total Sessions Booked', '2.5K',
                  'Total Booking This Month', '1.5K'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  children: [
                    Text('Upcoming Sessions',
                        style: TextStyles.textStyleRegular
                            .copyWith(color: AppColors.n900Black)),
                    const Spacer(),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyles.textStyleRegular.copyWith(
                                color: AppColors.primaryColor, height: 2),
                          ),
                          SvgPicture.asset('assets/image/profile/arrow.svg'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
