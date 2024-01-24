import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/user_features/Favorite/data/workout_card_model.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/tabs_cards/workout_tab_card.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/filters_types.dart';

class FavWorkoutTab extends StatelessWidget {
  const FavWorkoutTab({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const FilterType(type: 'Workout',),
          Expanded(
            child: ListView.builder(
              itemCount: workoutCardData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: WorkoutTabCard(
                    size: size, model: workoutCardData[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
