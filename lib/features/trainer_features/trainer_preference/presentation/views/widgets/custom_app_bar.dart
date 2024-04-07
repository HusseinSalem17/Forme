import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_state.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/animated_stepper_line.dart';

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
      leading: CustomAppBarArrowButton(
        onTap: () {
          pageViewController.animateToPage(
            BlocProvider.of<TrainerPreferenceBloc>(context).state.page - 1,
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
          );
        },
      ),
      title: BlocBuilder<TrainerPreferenceBloc, TrainerPreferenceState>(
        builder: (context, state) {
          return Row(
            children: [
              AnimatedStepperLine(state: state),
              const SizedBox(width: 8),
              Text(
                '${state.page + 1}/2',
                style: TextStyles.textStyleRegular.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
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
