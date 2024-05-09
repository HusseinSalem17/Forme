import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/header_text.dart';

import '../../../../core/transitions/page_slide.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_password_form_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  static const routeName = '/trainee/new-password-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
            color: AppColors.n900Black,
            size: 25 // Change the color of the AppBar icon
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'New Password',
                style: TextStyles.mainScreenTitle,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your new password must be different\n from previously used passwords',
                style: TextStyles.baseRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 16),
              CustomPasswordFromField(
                textEditingController: TextEditingController(),
                subTitle: 'Password',
                hintText: '********',
              ),
              const SizedBox(height: 16),
              CustomPasswordFromField(
                textEditingController: TextEditingController(),
                subTitle: 'Re-Enter Password',
                hintText: '********',
              ),
              const SizedBox(height: 32),
              CustomAuthButton(
                text: "Create New Password",
                isActive: true,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
