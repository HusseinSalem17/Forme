import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/preferences_screen.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/preferences_state.dart';
import 'animated_stepper_line.dart';
import 'custom_app_bar_arrow_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leadingWidth: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CustomAppBarArrowButton(pageViewController: pageViewController),
      title: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          return Row(
            children: [
              AnimatedStepperLine(state: state),
              const SizedBox(width: 8),
              Text(
                '${state.page + 1}/5',
                style: Styles.textStyleRegular14.copyWith(
                  color: AppColors.p300PrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
