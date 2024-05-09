import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_states.dart';
import 'package:forme_app/onboarding_screens/views/widgets/custom_pageview.dart';
import 'package:forme_app/onboarding_screens/views/widgets/pageview_buttons.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/on-boarding-view';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _WelcomeState();
}

class _WelcomeState extends State<OnBoardingScreen> {
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
            return Stack(
              children: [
                CustomPageView(
                  pageController: pageController,
                  state: state,
                ),
                PageViewButtons(
                  pageController: pageController,
                  state: state,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
