import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';
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
    return PageView(
      controller: pageViewController,
      onPageChanged: (int currentIndex) {
        context.read<TrainerPreferenceCubit>().page = currentIndex;
      },
      children: const [FirstPreferenceTrainer(), SecondPreferenceTrainer()],
    );
  }
}
