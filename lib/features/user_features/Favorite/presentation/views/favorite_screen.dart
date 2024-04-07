import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
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
          centerTitle: true,
          title: Text("Favorite", style: TextStyles.textStyleBold.copyWith(
                  fontSize: 18.sp, color: AppColors.n900Black),),
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
