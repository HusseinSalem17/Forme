import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Favorite/data/programs_card_model.dart';
import 'package:forme_app/features/Favorite/presentation/views/tabs/tabs_cards/programs_tab_card.dart';
import 'package:forme_app/features/Favorite/presentation/views/widgets/filters_types.dart';



class FavProgramsTab extends StatelessWidget {
  const FavProgramsTab({super.key});

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const FilterType(type: 'programs',),
          Expanded(
            child: ListView.builder(
              itemCount: programsCardModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ProgramsTabCard(
                    model: programsCardModel[index],
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