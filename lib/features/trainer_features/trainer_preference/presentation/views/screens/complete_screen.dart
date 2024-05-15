import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
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
    // TODO: implement initState
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/image/gif/correct.json',
                height: 220.h,
                width: 220.w,
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
                animate: true,
                repeat: false,
              ),
              Text(
                'The completion of your account information was successful.',
                textAlign: TextAlign.center,
                style:
                    TextStyles.textStyleSemiBold.copyWith(color: Colors.black),
              ),
              Text(
                'We are excited to have you with us!',
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonContainer(
                buttonTitle: 'Got to Profile',
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
