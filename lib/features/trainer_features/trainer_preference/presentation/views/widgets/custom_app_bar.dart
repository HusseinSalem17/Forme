import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';
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
      leadingWidth: 65,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CustomAppBarArrowButton(
        onTap: () {
          pageViewController.animateToPage(
            context.read<TrainerPreferenceCubit>().page - 1,
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
          );
        },
      ),
      title: Row(
        children: [
          const AnimatedStepperLine(),
          const SizedBox(width: 8),
          Text(
            '${context.read<TrainerPreferenceCubit>().page + 1}/2',
            style: TextStyles.textStyleRegular.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (context.read<TrainerPreferenceCubit>().page < 1) {
                pageViewController.animateToPage(
                  context.read<TrainerPreferenceCubit>().page + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.of(context).pushReplacement(
                    PageSlideTransition(const TrainerCompleteProfile()));
              }
            },
            child: Text(
              'Skip',
              style: TextStyles.textStyleRegular.copyWith(
                color: AppColors.primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
