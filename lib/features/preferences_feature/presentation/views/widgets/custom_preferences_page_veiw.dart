import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_event.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_state.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/widgets/pick_your_goal_screen_body.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/widgets/pick_your_level_screen_body.dart';

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
                child: Text('1'),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Center(
                child: Text('2'),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Center(
                child: Text('3'),
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
