import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/sports_club_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/sports_club_tab_card.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/widgets/filters_types.dart';

import '../widgets/custom_expanded_list_view.dart';

class FavSportsClubTab extends StatelessWidget {
  const FavSportsClubTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.5, bottom: 22, left: 24.w),
            child: const FilterType(
                type: 'sports club',
                categories: ['All', 'GYM', 'YOGA', 'Running', 'Boxing']),
          ),
          CustomExpandedListView(
            itemCount: sportsClubCardModel.length,
            itemBuilder: (context, index) {
              return SportsClubTabCard(
                model: sportsClubCardModel[index],
                size: size,
              );
            },
          ),
        ],
      ),
    );
  }
}
