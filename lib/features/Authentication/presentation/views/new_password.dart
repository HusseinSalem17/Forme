import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/header_text.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});
  static const routeName = '/new-password-view';
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
                    title: 'New Password',
                    subtitle:
                        "Your new password must be different from previously used passwords"),
                CustomTextFormField(
                  title: 'Password',
                  hint: 'enter the password',
                  type: 'password',
                  topPadding: 40.h,
                ),
                CustomTextFormField(
                  title: 'Re-Enter Password',
                  hint: 're-enter the password',
                  type: 'password',
                  topPadding: 16.h,
                  bottomPadding: 40.h,
                ),
                CustomAuthButton(
                  text: "Create New Password",
                  isActive: true,
                  onPressed: () {
                    //create a new password
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
