import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/utils/app_colors.dart';
import '../../../features/Authentication/presentation/views/sign_in_view.dart';


import '../../../core/utils/app_colors.dart';

import '../../data/bloc/onboarding_states.dart';
import 'buttons/left_arrow_button.dart';
import 'buttons/right_arrow_button.dart';
import 'indicator.dart';

class PageViewButtonsSections extends StatefulWidget {
  const PageViewButtonsSections({
    super.key,
    required this.pageController,
    required this.state,
  });

  final PageController pageController;
  final OnBoardingState state;

  @override
  State<PageViewButtonsSections> createState() =>
      _PageViewButtonsSectionsState();
}

class _PageViewButtonsSectionsState extends State<PageViewButtonsSections> {
  @override

  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.state.page > 0
              ? GestureDetector(

            onTap: () {
              widget.pageController.animateToPage(
                --widget.state.page,
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


          DotIndicator(page: widget.state.page),
          GestureDetector(
            onTap: () {
              if (widget.state.page < 2) {
                widget.pageController.animateToPage(
                  ++widget.state.page,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
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