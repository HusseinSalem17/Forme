import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_states.dart';
import 'package:forme_app/onboarding_screens/views/widgets/custom_pageview.dart';
import 'package:forme_app/onboarding_screens/views/widgets/pageview_buttons_sections.dart';

class OnBoardingView extends StatefulWidget {
  static const routeName = '/on-boarding-view';
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _WelcomeState();
}

class _WelcomeState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, OnBoardingState state) {
            return SizedBox(
              width: 375.w,
              child: Stack(
                children: [
                  CustomPageView(
                    pageController: pageController,
                    state: state,
                  ),
                  PageViewButtonsSections(
                    pageController: pageController,
                    state: state,
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
