import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/user_features/Favorite/data/trainer_card_model.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/tabs_cards/trainer_tab_card.dart';
import 'package:forme_app/features/user_features/search/presentation/views/widgets/filters_types.dart';

class FavTrainerTab extends StatelessWidget {
  const FavTrainerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const FilterType(type: 'trainer',categories:['All', 'GYM', 'YOGA', 'Running', 'Boxing']),
          Expanded(
            child: ListView.builder(
              itemCount: trainerCardModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TrainerTabCard(
                    model: trainerCardModel[index],
                    size: MediaQuery.of(context).size,
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