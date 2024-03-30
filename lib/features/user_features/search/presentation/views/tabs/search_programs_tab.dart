import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/search/data/program_search_card_model.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/tabs_cards/search_programs_tab_card.dart';

import '../widgets/custom_results_tabs.dart';

class SearchProgramsTab extends StatelessWidget {
  const SearchProgramsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SearchResultsTab(
      searchText: "Online Coach",
      searchResults: programsSearchCardModel.length,
      itemBuilder: (context, item) => SearchProgramsTabCard(
        size: size,
        model: programsSearchCardModel[item],
      ),
    );
  }
}