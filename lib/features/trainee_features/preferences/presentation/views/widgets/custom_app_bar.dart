import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/preferences_screen.dart';
import '../../manager/preferences_state.dart';
import 'animated_stepper_line.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

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
            BlocProvider.of<PreferencesBloc>(context).state.page - 1,
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
          );
        },
      ),
      title: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          return Row(
            children: [
              AnimatedStepperLine(state: state),
              const SizedBox(width: 8),
              Text(
                '${state.page + 1}/5',
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
