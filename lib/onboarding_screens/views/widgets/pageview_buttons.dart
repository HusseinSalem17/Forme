import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/Authentication/presentation/views/sign_in_screen.dart';
import '../../data/bloc/onboarding_states.dart';
import 'back_button.dart';
import 'forward_button.dart';
import 'indicator.dart';

class PageViewButtons extends StatelessWidget {
  const PageViewButtons({
    super.key,
    required this.pageController,
    required this.state,
  });

  final PageController pageController;
  final OnBoardingState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          state.page > 0
              ? GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      --state.page,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const CustomBackButton(),
                )
              : CircleAvatar(
                  backgroundColor: AppColors.background,
                  radius: 21.w,
                ),
          DotIndicator(page: state.page),
          GestureDetector(
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
            child: const CustomNextButton(),
          ),
        ],
      ),
    );
  }
}
