import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_screen.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_states.dart';

import '../../../core/utils/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton(
      {super.key, required this.pageController, required this.state});

  final PageController pageController;
  final OnBoardingState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (state.page < 2) {
          pageController.animateToPage(
            ++state.page,
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
          );
        } else {
          Navigator.of(context).pushReplacement(
            PageSlideTransition(
              const SignInScreen(),
            ),
          );
        }
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(right: 25.5.w),
          child: Text(
            'Skip',
            style: TextStyles.descriptionStyle.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
