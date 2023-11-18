import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/onboarding_screens/views/widgets/pageview_content.dart';

import '../../../core/utils/image_assets.dart';
import '../../../core/utils/text_styles.dart';
import '../../data/bloc/onboarding_blocs.dart';
import '../../data/bloc/onboarding_events.dart';
import '../../data/bloc/onboarding_states.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.state,
  });

  final PageController pageController;
  final OnBoardingState state;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        state.page = index;
        BlocProvider.of<OnBoardingBloc>(context).add(
          OnBoardingEvent(),
        );
      },
      children: [
        PageViewContent(
          index: 1,
          context: context,
          image: AssetsImages.onBoardingScreen1,
          title1: "Embrace Fitness at ",
          titleStyle1: Styles.headerStyle,
          title2: "Any Age \nand in Every Sport",
          titleStyle2: Styles.kHeaderStyle,
          description:
              'Fitness without limits. Embrace any sport, any age.\nJoin us for a diverse range of training options.',
        ),
        PageViewContent(
          index: 2,
          context: context,
          image: AssetsImages.onBoardingScreen2,
          title1: "Trainers, Programs, and Courses",
          titleStyle1: Styles.kHeaderStyle,
          title2: "\nat Your Fingertips",
          titleStyle2: Styles.headerStyle,
          description:
              'Discover skilled trainers, connect, and enroll in personalized fitness programs and courses.',
        ),
        PageViewContent(
          index: 3,
          context: context,
          image: AssetsImages.onBoardingScreen3,
          title1: "Find Nearby",
          titleStyle1: Styles.headerStyle,
          title2: " Training Facilities, \nBook Memberships",
          titleStyle2: Styles.kHeaderStyle,
          description:
              'Discover nearby training facilities in various sports \nfields. Elevate your fitness journey and easily book memberships at these places.',
        ),
      ],
    );
  }
}
