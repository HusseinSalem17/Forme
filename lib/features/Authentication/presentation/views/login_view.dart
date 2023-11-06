import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_check_component.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/icon_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //temp sized box
              const Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    child: Text("العربية"),
                  )),
              const Spacer(flex: 1),
              const Text(
                'SignIn',
                style: Styles.headerStyle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const Text(
                  "Hi! Welcome back, you’ve missed",
                  style: Styles.descriptionStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCheckComponent(
                      title: 'I\'m a Client',
                      url: "assets/image/Icon/Trainer.svg",
                      onTap: () {},
                    ),
                    CustomCheckComponent(
                      title: 'I\'m a Client',
                      url: "assets/image/Icon/Trainee.svg",
                      color: AppColors.p300PrimaryColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const CustomTextFormField(
                  title: 'Email', hint: 'example@gmail.com', type: 'email'),
              const CustomTextFormField(
                  title: 'Password',
                  hint: 'enter your password',
                  type: 'password'),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget password",
                        style: Styles.textStyleMedium14.copyWith(
                          color: AppColors.p300PrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ))),
              const CustomAuthButton(text: "Sign In"),
              const AuthDivider(),
              Padding(
                padding: EdgeInsets.only(right: 32.0.w, left: 32.w, top: 26.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      iconWidget('Google', () {}),
                      iconWidget('Facebook', () {}),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Styles.textStyleLight16.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.n500Color),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: Styles.textStyleLight16.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.p300PrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                ],
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppColors.background,
                      child: SvgPicture.asset("assets/image/Icon/Vector.svg")),
                  FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppColors.background,
                      child: SvgPicture.asset("assets/image/Icon/Group.svg")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
