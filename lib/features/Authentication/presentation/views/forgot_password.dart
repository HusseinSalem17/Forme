import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/back_icon.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = '/Forgot-password';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BackIcon(),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: const Text(
                    'Forgot Password?',
                    style: Styles.headerStyle,
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Don’t worry! it occurs. Please enter the email address linked with your account",
                    textAlign: TextAlign.center,
                    style: Styles.descriptionStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: SvgPicture.asset("assets/image/Fitness.svg"),
                ),
                CustomTextFormField(
                  title: 'Email',
                  hint: 'example@gmail.com',
                  type: 'email',
                  topPadding: 32.h,
                  bottomPadding: 24.h,
                ),
                const CustomAuthButton(
                  text: "Send Code",
                  isActive: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
