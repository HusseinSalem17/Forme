import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/icon_widget.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        title: 'Email',
        hint: 'example@gmail.com',
        type: 'email',
        topPadding: 16.h,
        bottomPadding: 0,
      ),
      CustomTextFormField(
        title: 'Password',
        hint: 'enter your password',
        type: 'password',
        topPadding: 16.h,
        bottomPadding: 0,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(PageSlideTransition(const ForgetPasswordScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                child: Text(
                  "Forget password?",
                  style: Styles.textStyleRegular12.copyWith(
                    color: AppColors.p300PrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )),
      ),
      CustomAuthButton(
        text: "Sign In",
        isActive: true,
        onPressed: () {},
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: const AuthDivider(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          iconWidget('Google', () {}),
          iconWidget('Facebook', () {}),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(top: 24.0.h),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                  text: 'Don\'t have an account?',
                  style: Styles.textStyleRegular14),
              TextSpan(
                  text: 'Sign Up',
                  style: Styles.textStyleRegular14.copyWith(
                    color: AppColors.p300PrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context)
                          .push(PageSlideTransition(const SignUpScreen()));
                    }),
            ],
          ),
        ),
      ),
    ]);
  }
}
