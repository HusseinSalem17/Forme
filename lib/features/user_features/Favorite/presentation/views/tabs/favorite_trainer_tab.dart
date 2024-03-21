import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/user_features/Favorite/data/trainer_card_model.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/tabs_cards/trainer_tab_card.dart';
import 'package:forme_app/features/user_features/search/presentation/views/widgets/filters_types.dart';

import '../widgets/custom_expanded_list_view.dart';

class FavTrainerTab extends StatelessWidget {
  const FavTrainerTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.5, bottom: 22, left: 24.w),
            child: const FilterType(type: 'trainer',categories:['All', 'GYM', 'YOGA', 'Running', 'Boxing']),
          ),
          CustomExpandedListView(
            itemCount: trainerCardModel.length,
            itemBuilder: (context, index) {
              return TrainerTabCard(
                size: size,
                model: trainerCardModel[index],
              );
            },
          ),
        ],
      ),
    );
  }
}