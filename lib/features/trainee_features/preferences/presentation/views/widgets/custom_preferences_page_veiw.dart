import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_event.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_state.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/age_slider.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/height_slider.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/pick_your_age_screen_body.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/pick_your_goal_screen_body.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/pick_your_height_screen_body.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/pick_your_level_screen_body.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/pick_your_weight_screen_body.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/weight_slider.dart';

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
          children: const [
            PickYourAgeScreenBody(),
            PickYourWeightScreenBody(),
            PickYourHeightScreenBody(),
            PickYourGoalScreenBody(),
            PickYourLevelScreenBody(),
          ],
        );
      },
    );
  }
}
