import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_states.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';
import 'buttons/skip_button.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    super.key,
    required this.image,
    required this.blackText,
    required this.blueText,
    required this.description,
    required this.blackTextStyle,
    required this.blueTextStyle,
    required this.context,
    required this.pageController,
    required this.state,
  });

  final BuildContext context;
  final String image, blackText, blueText, description;
  final TextStyle blackTextStyle, blueTextStyle;
  final PageController pageController;
  final OnBoardingState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkipButton(
          pageController: pageController,
          state: state,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: 342.w,
            height: 400.h,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(flex: 2),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: blackText,
                style: blueTextStyle,
              ),
              TextSpan(
                text: blueText,
                style: blackTextStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: TextStyles.textStyleRegular.copyWith(
                    color: AppColors.n70HintColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}
