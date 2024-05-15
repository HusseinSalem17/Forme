import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/workout_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/workout_tab_card.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/widgets/filters_types.dart';

import '../widgets/custom_expanded_list_view.dart';

class FavWorkoutTab extends StatelessWidget {
  const FavWorkoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.5, bottom: 22, left: 24.w),
            child: const FilterType(
                type: 'Workout',
                categories: ['All', 'GYM', 'YOGA', 'Running', 'Boxing']),
          ),
          CustomExpandedListView(
            itemCount: workoutCardData.length,
            itemBuilder: (context, index) {
              return WorkoutTabCard(
                size: size,
                model: workoutCardData[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
