import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/search_programs_tab.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/search_sports_club_tab.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/search_trainer_tab.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/search_workout_tab.dart';


class ResultsSearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';

  const ResultsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: AppColors.background,
              child: const CustomTabBar(
                titles: ['Workout', 'Programs', 'Trainer', 'Sports Club'],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SearchWorkoutTab(),
                  SearchProgramsTab(),
                  SearchTrainerTab(),
                  SearchSportsClubTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
