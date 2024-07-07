import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/featured_workouts_card_item.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_card_item.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/workout_detail.dart';

import '../../manager/bloc/featured_workouts_bloc/featured_workouts_bloc.dart';

class FeaturedWorkoutsList extends StatelessWidget {
  const FeaturedWorkoutsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageSlideTransition(
            const WorkOutDetail(),
          ),
        );
      },
      child: BlocBuilder<FeaturedWorkoutsBloc, FeaturedWorkoutsState>(
        builder: (context, state) {
          if (state is GetFeaturedWorkoutsLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetFeaturedWorkoutsFailure) {
            return Text('Error: ${state.errorMsg}');
          } else if (state is GetFeaturedWorkoutsSuccess) {
            return SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.featuredWorkoutData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 24)
                        : const EdgeInsets.symmetric(horizontal: 8),
                    child: FeaturedWorkoutsCardItem(
                      size: size,
                      featuredWorkoutData: state.featuredWorkoutData[index],
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
