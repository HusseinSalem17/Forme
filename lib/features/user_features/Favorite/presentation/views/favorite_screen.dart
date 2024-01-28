import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/favorite_programs_tab.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/favorite_sports_club_tab.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/favorite_trainer_tab.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/tabs/favorite_workout_tab.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorite-screen';
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CustomAppBarArrowButton(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          centerTitle: true,
          title: Text("Bookmark", style: TextStyles.heading4Bold.copyWith(fontSize: 18)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              width: double.maxFinite,
              color: AppColors.background,
              child: const CustomTabBar(
                titles: ['Workout', 'Programs', 'Trainer', 'Sports Club'],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FavWorkoutTab(),
            FavProgramsTab(),
            FavTrainerTab(),
            FavSportsClubTab(),
          ],
        ),
      ),
    );
  }
}
