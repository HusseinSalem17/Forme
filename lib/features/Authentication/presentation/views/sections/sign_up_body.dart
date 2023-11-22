import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/icon_widget.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        title: 'Email',
        hint: 'example@gmail.com',
        type: 'email',
        topPadding: 8.h,
        bottomPadding: 0,
      ),
      CustomTextFormField(
        title: 'Password',
        hint: 'enter your password',
        type: 'password',
        topPadding: 8.h,
        bottomPadding: 0,
      ),
      CustomTextFormField(
        title: 'Re-Enter Password',
        hint: 'enter your password again',
        type: 'password',
        topPadding: 8.h,
        bottomPadding: 0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            focusColor: AppColors.n70HintColor,
            activeColor: AppColors.p300PrimaryColor,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(
            width: 280,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                      text: 'By continuing you accept our ',
                      style: Styles.textStyleRegular14),
                  TextSpan(
                      text: 'Privacy Policy and Term of Use',
                      style: Styles.textStyleRegular14.copyWith(
                        color: AppColors.p300PrimaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //privacy and policy screen
                        }),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 32.0.h),
        child: const CustomAuthButton(
          text: "Sign Up",
          isActive: true,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: const AuthDivider(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          iconWidget('Google', () {}),
          iconWidget('Facebook', () {}),
        ]),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                  text: 'Already have an account?',
                  style: Styles.textStyleRegular14),
              TextSpan(
                  text: 'Sign In',
                  style: Styles.textStyleRegular14.copyWith(
                    color: AppColors.p300PrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    }),
            ],
          ),
        ),
      ),
    ]);
  }
}
