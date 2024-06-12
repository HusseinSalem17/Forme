import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/authentication/presentation/views/forgot_password_screen.dart';

class PasswordManager extends StatelessWidget {
  static const routeName = '/password-manager-screen';
  const PasswordManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context, 'Password Manager'),
        body: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // const CustomTextFormField(
                    //   title: 'Current Password',
                    //   hint: 'enter your current password',
                    //   type: 'password',
                    //   topPadding: 16,
                    //   bottomPadding: 0,
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            PageSlideTransition(const ForgotPasswordScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Text(
                          "Forget password?",
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    // const CustomTextFormField(
                    //   title: 'New Password',
                    //   hint: 'enter your new password',
                    //   type: 'password',
                    //   topPadding: 16,
                    //   bottomPadding: 0,
                    // ),
                    // const CustomTextFormField(
                    //   title: 'Confirm New Password',
                    //   hint: 'confirm your password',
                    //   type: 'password',
                    //   topPadding: 16,
                    //   bottomPadding: 0,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Submit',
            ),
          )
        ]));
  }
}
