// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/image_assets.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/pages/onboarding_screen/data/bloc/onboarding_blocs.dart';
import 'package:forme_app/pages/onboarding_screen/data/bloc/onboarding_events.dart';
import 'package:forme_app/pages/onboarding_screen/data/bloc/onboarding_states.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/buttons/left_arrow_button.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/buttons/right_arrow_button.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/indicator.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/onboarding_content.dart';
import 'package:forme_app/pages/page_after_onboarding.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _WelcomeState();
}

class _WelcomeState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return SizedBox(
              width: 375.w,
              child: Stack(
                children: [
                  PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(OnboardingEvent());
                    },
                    children: [
                      _page(
                          index: 1,
                          context: context,
                          image: AssetsImages.onboardingScreen1,
                          title1: "Embrace Fitness at ",
                          titleStyle1: Styles.headerStyle,
                          title2: "Any Age \nand in Every Sport",
                          titleStyle2: Styles.kHeaderStyle,
                          description:
                              'Fitness without limits. Embrace any sport, any age.\nJoin us for a diverse range of training options.'),
                      _page(
                          index: 2,
                          context: context,
                          image: AssetsImages.onboardingScreen2,
                          title1: "Trainers, Programs, and Courses",
                          titleStyle1: Styles.kHeaderStyle,
                          title2: "\nat Your Fingertips",
                          titleStyle2: Styles.headerStyle,
                          description:
                              'Discover skilled trainers, connect, and enroll in personalized fitness programs and courses.'),
                      _page(
                        index: 3,
                        context: context,
                        image: AssetsImages.onboardingScreen3,
                        title1: "Find Nearby",
                        titleStyle1: Styles.headerStyle,
                        title2: " Training Facilities, \nBook Memberships",
                        titleStyle2: Styles.kHeaderStyle,
                        description:
                            'Discover nearby training facilities in various sports \nfields. Elevate your fitness journey and easily book memberships at these places.',
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 660.w, right: 24.w, left: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.page > 0
                            ? GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                            --state.page,
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            curve: Curves.easeOutBack);
                              },
                              child: const IconLeftArrowButton()
                            )
                            : SizedBox(
                                height: 82.h,
                                width: 80.w,
                              ),
                        DotIndicator(page: state.page),
                        GestureDetector(
                          onTap: () {
                            if (state.page < 2) {
                              pageController.animateToPage(++state.page,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn);
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PageAfterOnBoarding()));
                            }
                          },
                          child: const IconRightArrowButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _page extends StatelessWidget {
  const _page({
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
    required this.titleStyle1,
    required this.titleStyle2,
    required this.index,
    required this.context,
  });
  final int index;
  final BuildContext context;
  final String image, title1, title2, description;
  final TextStyle titleStyle1, titleStyle2;
  @override
  Widget build(BuildContext context) {
    return OnBoardingContent(
        image: image,
        title1: title1,
        title2: title2,
        description: description,
        titleStyle1: titleStyle1,
        titleStyle2: titleStyle2);
  }
}
