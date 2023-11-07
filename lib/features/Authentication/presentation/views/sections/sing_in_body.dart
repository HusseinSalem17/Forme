import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
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
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forget password",
                  style: Styles.textStyleRegular12.copyWith(
                    color: AppColors.p300PrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ))),
      ),
      const CustomAuthButton(
        text: "Sign In",
        isActive: false,
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
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
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
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
