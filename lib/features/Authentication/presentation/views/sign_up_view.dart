import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_and_up_header.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/Sing-up-view';
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
              color: AppColors.n900PrimaryTextColor,
              size: 25 // Change the color of the AppBar icon
              ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingInAndUpHeader(
                    header: 'Create Account',
                    description:
                        'Fill your information bellow or register with your social account.',
                  ),
                  SignUpBody()
                ],
              ),
            ),
          ),
        ));
  }
}
