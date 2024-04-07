import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/onboarding_screens/views/widgets/pageview_content.dart';
import '../../../core/utils/app_colors.dart';
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
          context: context,
          pageController: pageController,
          state: state,
          image: AssetsImages.onBoardingScreen1,
          blackText: "Embrace Fitness at ",
          blackTextStyle: TextStyles.headerStyle
              .copyWith(color: AppColors.n900Black),
          blueText: "Any Age \nand in Every Sport",
          blueTextStyle: TextStyles.headerStyle,
          description:
              'Fitness without limits. Embrace any sport, any age.\nJoin us for a diverse range of training options.',
        ),
        PageViewContent(
          context: context,
          pageController: pageController,
          state: state,
          image: AssetsImages.onBoardingScreen2,
          blackText: "Trainers, Programs, and Courses",
          blackTextStyle: TextStyles.headerStyle,
          blueText: "\nat Your Fingertips",
          blueTextStyle: TextStyles.headerStyle
              .copyWith(color: AppColors.n900Black),
          description:
              'Discover skilled trainers, connect, and enroll in personalized fitness programs and courses.',
        ),
        PageViewContent(
          context: context,
          pageController: pageController,
          state: state,
          image: AssetsImages.onBoardingScreen3,
          blackText: "Find Nearby",
          blackTextStyle: TextStyles.headerStyle
              .copyWith(color: AppColors.n900Black),
          blueText: " Training Facilities, \nBook Memberships",
          blueTextStyle: TextStyles.headerStyle,
          description:
              'Discover nearby training facilities in various sports \nfields. Elevate your fitness journey and easily book memberships at these places.',
        ),
      ],
    );
  }
}
