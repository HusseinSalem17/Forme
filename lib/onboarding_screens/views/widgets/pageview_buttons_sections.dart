import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/bloc/onboarding_states.dart';
import 'buttons/left_arrow_button.dart';
import 'buttons/right_arrow_button.dart';
import 'indicator.dart';

class PageViewButtonsSections extends StatelessWidget {
  const PageViewButtonsSections({
    super.key,
    required this.pageController,
    required this.state,
  });

  final PageController pageController;
  final OnBoardingState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 660.w, right: 24.w, left: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          state.page > 0
              ? GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      --state.page,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeOutBack,
                    );
                  },
                  child: const IconLeftArrowButton(),
                )
              : SizedBox(
                  height: 82.h,
                  width: 80.w,
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
              } else {}
            },
            child: const IconRightArrowButton(),
          ),
        ],
      ),
    );
  }
}
