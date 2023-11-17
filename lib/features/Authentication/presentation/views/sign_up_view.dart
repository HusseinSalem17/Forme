import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_sections/sign_in_and_up_header.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_sections/sing_up_body.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/back_icon.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/Sing-up-view';
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: const SafeArea(
        child: Column(
          children: [
            BackIcon(),
            SingInAndUpHeader(
              header: 'Create Account',
              description:
                  'Fill your information bellow or register with your social account.',
            ),
            SignUpBody()
          ],
        ),
      ),
    ));
  }
}
