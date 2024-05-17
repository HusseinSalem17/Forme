import 'package:flutter/material.dart';
import 'package:forme_app/features/trainee_features/search/data/workout_search_card_model.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/tabs/tabs_cards/search_workout_tab_card.dart';

import '../widgets/custom_results_tabs.dart';

class SearchWorkoutTab extends StatefulWidget {
  const SearchWorkoutTab({Key? key}) : super(key: key);

  @override
  State<SearchWorkoutTab> createState() => _SearchWorkoutTabState();
}

class _SearchWorkoutTabState extends State<SearchWorkoutTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SearchResultsTab(
      searchText: "Yoga",
      searchResults: workoutSearchCardModel.length,
      itemBuilder: (context, item) => SearchWorkoutTabCard(
        size: size,
        model: workoutSearchCardModel[item],
      ),
    );
  }
}
