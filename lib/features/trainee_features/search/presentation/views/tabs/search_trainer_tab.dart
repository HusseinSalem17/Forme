import 'package:flutter/material.dart';
import 'package:forme_app/features/trainee_features/search/data/trainer_search_card_model.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/tabs/tabs_cards/search_trainer_tab_card.dart';

import '../widgets/custom_results_tabs.dart';

class SearchTrainerTab extends StatelessWidget {
  const SearchTrainerTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SearchResultsTab(
        searchText: "Hussein",
        searchResults: trainerSearchCardModel.length,
        itemBuilder: (context, item) => SearchTrainerTabCard(
              size: size,
              model: trainerSearchCardModel[item],
            ));
  }
}
