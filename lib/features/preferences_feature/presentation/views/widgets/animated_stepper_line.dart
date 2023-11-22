import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_state.dart';

import '../../../../../core/utils/app_colors.dart';

class AnimatedStepperLine extends StatelessWidget {
  final PreferencesState state;

  const AnimatedStepperLine({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 212,
          height: 4,
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: AppColors.p300PrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: (state.page + 1) * 42.4,
          height: 4,
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
