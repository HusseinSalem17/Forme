import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_sections/sign_in_and_up_header.dart';

import 'package:forme_app/features/Authentication/presentation/views/sign_up_sections/sing_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/image/Icon/arrowe.svg'))),
            const SingInAndUpHeader(
              header: 'Create Account',
              description:
                  'Fill your information bellow or register with your social account.',
            ),
            const SignUpBody()
          ],
        ),
      ),
    ));
  }
}
