import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/user_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/user_features/preferences/presentation/manager/preferences_event.dart';
import 'package:forme_app/features/user_features/preferences/presentation/manager/preferences_state.dart';
import 'package:forme_app/features/user_features/preferences/presentation/views/widgets/age_slider.dart';
import 'package:forme_app/features/user_features/preferences/presentation/views/widgets/height_slider.dart';
import 'package:forme_app/features/user_features/preferences/presentation/views/widgets/pick_your_goal_screen_body.dart';
import 'package:forme_app/features/user_features/preferences/presentation/views/widgets/pick_your_level_screen_body.dart';
import 'package:forme_app/features/user_features/preferences/presentation/views/widgets/weight_slider.dart';

class CustomPreferencesPageView extends StatelessWidget {
  final PageController pageViewController;

  const CustomPreferencesPageView({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (BuildContext context, PreferencesState state) {
        return PageView(
          controller: pageViewController,
          onPageChanged: (int currentIndex) {
            state.page = currentIndex;
            BlocProvider.of<PreferencesBloc>(context).add(
              PreferencesEvent(),
            );
          },
          children: [
            Container(
              color: Colors.white,
              child: const Center(
                child: AgeSlider(),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Center(
                child: WeightSlider(),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Center(
                child: HeightSlider(),
              ),
            ),
            const PickYourGoalScreenBody(),
            const PickYourLevelScreenBody(),
          ],
        );
      },
    );
  }
}
