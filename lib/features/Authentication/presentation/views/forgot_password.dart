import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/authentication/presentation/views/verify_code.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/header_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = '/Forgot-password';
  const ForgetPasswordScreen({super.key});

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderText(
                    title: 'Forgot Password?',
                    subtitle:
                        "Don’t worry! it occurs. Please enter the email address linked with your account"),
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
                CustomAuthButton(
                  text: "Send Code",
                  isActive: true,
                  onPressed: () {
                    Navigator.of(context)
                        .push(PageSlideTransition(const VerifyCodeScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
