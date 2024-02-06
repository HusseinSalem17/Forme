import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_event.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_state.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/screens/first_preference_trainer.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/screens/second_preference_trainer.dart';


class CustomPreferencesPageView extends StatelessWidget {
  final PageController pageViewController;

  const CustomPreferencesPageView({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerPreferenceBloc, TrainerPreferenceState>(
      builder: (BuildContext context, TrainerPreferenceState state) {
        return PageView(
          controller: pageViewController,
          onPageChanged: (int currentIndex) {
            state.page = currentIndex;
            BlocProvider.of<TrainerPreferenceBloc>(context).add(
              TrainerPreferenceEvent(),
            );
          },
          children: const [
            FirstPreferenceTrainer(),
            SecondPreferenceTrainer()
          ],
        );
      },
    );
  }
}
