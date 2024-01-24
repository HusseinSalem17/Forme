import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/user_features/Favorite/data/sports_club_card_model.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/tabs_cards/sports_club_tab_card.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/filters_types.dart';

class FavSportsClubTab extends StatelessWidget {
  const FavSportsClubTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const FilterType(type: 'sports club',),
          Expanded(
            child: ListView.builder(
              itemCount: sportsClubCardModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SportsClubTabCard(
                    model: sportsClubCardModel[index],
                    size: size,
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