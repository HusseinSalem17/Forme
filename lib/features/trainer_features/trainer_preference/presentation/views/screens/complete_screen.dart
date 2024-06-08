import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'package:lottie/lottie.dart';

class CompletePreferenceScreen extends StatefulWidget {
  const CompletePreferenceScreen({super.key});

  @override
  State<CompletePreferenceScreen> createState() =>
      _CompletePreferenceScreenState();
}

class _CompletePreferenceScreenState extends State<CompletePreferenceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          _Content(controller: _controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: CustomAppButton(
                title: 'Go to Profile',
                onTap: () {
                  Navigator.of(context).push(
                      PageSlideTransition(const TrainerCompleteProfile()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final AnimationController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LottieAnimation(controller: controller),
        _SuccessMessage(),
      ],
    );
  }
}

class _LottieAnimation extends StatelessWidget {
  final AnimationController controller;

  const _LottieAnimation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      'https://forme-app-7pffc.ondigitalocean.app/media/done.json',
      height: 220.h,
      width: 220.w,
      controller: controller,
      onLoaded: (composition) {
        controller
          ..duration = composition.duration
          ..forward();
      },
      animate: true,
      repeat: false,
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'The completion of your account information was successful.',
              style: TextStyles.textStyleSemiBold
                  .copyWith(color: AppColors.n900Black, height: 1),
            ),
            TextSpan(
              text: '\nWe are excited to have you with us!',
              style: TextStyles.textStyleRegular
                  .copyWith(fontSize: 12.sp, height: 2),
            ),
          ],
        ),
      ),
    );
  }
}
