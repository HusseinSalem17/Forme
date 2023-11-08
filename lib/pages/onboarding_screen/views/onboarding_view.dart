import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/image_assets.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/pages/onboarding_screen/data/onboarding_data.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/Skip_button.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/indicator.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/onboarding_content.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          // width: 375.w,
          child: Column(
            children: [
            const SkipButton(),
              PageView.builder(
                itemCount: onboardData.length,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onboardData[index].image,
                  title1: onboardData[index].title1,
                  titleStyle1: onboardData[index].titleStyle1,
                  title2: onboardData[index].title2,
                  titleStyle2: onboardData[index].titleStyle2,
                  description: onboardData[index].description,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _pageIndex == 0
                      ? Container(
                          padding: EdgeInsets.only(top: 64.sp),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_circle_left_outlined,
                              color: Colors.blue,
                              size: 60.sp,
                            ),
                            onPressed: () {},
                          ),
                        )
                      : SizedBox(
                          width: 44.sp,
                          height: 44.sp,
                        ),
                  
                  Container(
                    padding: EdgeInsets.only(top: 64.sp, right: 16.sp),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.blue,
                        size: 60.sp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

final List<Onboard> onboardData = [
  Onboard(
      image: AssetsImages.onboardingScreen1,
      title1: "Embrace Fitness at ",
      titleStyle1: Styles.headerStyle,
      title2: "Any Age \nand in Every Sport",
      titleStyle2: Styles.kHeaderStyle,
      description:
          'Fitness without limits. Embrace any sport, any age. Join us for a diverse range of training options.'),
  Onboard(
      image: AssetsImages.onboardingScreen2,
      title1: "Trainers, Programs, and Courses",
      titleStyle1: Styles.kHeaderStyle,
      title2: "\nat Your Fingertips",
      titleStyle2: Styles.headerStyle,
      description:
          'Discover skilled trainers, connect, and enroll in personalized fitness programs and courses.'),
  Onboard(
      image: AssetsImages.onboardingScreen3,
      title1: "Find Nearby",
      titleStyle1: Styles.headerStyle,
      title2: " Training Facilities, \nBook Memberships",
      titleStyle2: Styles.kHeaderStyle,
      description:
          'Discover nearby training facilities in various sports fields. Elevate your fitness journey and easily book memberships at these places.'),
];
