import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_check_component.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/language_icon.dart';

class SingInHeader extends StatefulWidget {
  const SingInHeader({super.key});

  @override
  State<SingInHeader> createState() => _SingInHeaderState();
}

class _SingInHeaderState extends State<SingInHeader>
    with SingleTickerProviderStateMixin {
  double _start = 220.w;
  bool _clientIsChecked = true;
  @override
  void initState() {
    super.initState();
  }

  void _moveLeft() {
    setState(() {
      _start -= 140.w;
      if (_start <= 80.w) _start = 80.w;
    });
  }

  void _moveRight() {
    setState(() {
      _start += 140.w;
      if (_start >= 220.w) {
        _start = 220.w;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageIcon(
          url: "assets/image/Icon/egypt-flag.svg",
          language: 'العربيه',
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: const Text(
            'SignIn',
            style: Styles.headerStyle,
          ),
        ),
        const Text(
          "Hi! Welcome back, you’ve missed",
          style: Styles.descriptionStyle,
        ),
        Padding(
          padding: EdgeInsets.only(top: 32.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCheckComponent(
                title: 'I\'m a trainer',
                url: "assets/image/Icon/Trainer.svg",
                color: _clientIsChecked
                    ? AppColors.n80NavColor
                    : AppColors.p300PrimaryColor,
                onTap: () {
                  _moveLeft();
                  _clientIsChecked = false;
                },
              ),
              CustomCheckComponent(
                title: 'I\'m a Client',
                url: "assets/image/Icon/Trainee.svg",
                color: _clientIsChecked
                    ? AppColors.p300PrimaryColor
                    : AppColors.n80NavColor,
                onTap: () {
                  _moveRight();
                  _clientIsChecked = true;
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
          width: 400,
          child: Stack(children: [
            AnimatedPositionedDirectional(
              start: _start,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 50,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
