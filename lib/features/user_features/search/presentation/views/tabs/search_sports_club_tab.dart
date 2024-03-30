import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/search/data/sports_club_search_card_model.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/tabs_cards/search_sports_club_tab_card.dart';

import '../widgets/custom_results_tabs.dart';

class SearchSportsClubTab extends StatelessWidget {
  const SearchSportsClubTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SearchResultsTab(
      searchText: "GYM",
      searchResults: sportsClubSearchCardModel.length,
      itemBuilder: (context, item) => SearchSportsClubTabCard(
        size: size,
        model: sportsClubSearchCardModel[item],
      ));
  }
}