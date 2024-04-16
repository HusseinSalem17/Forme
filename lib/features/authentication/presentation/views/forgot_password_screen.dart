import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/slider_type_choice.dart';

import '../../../../core/transitions/page_slide.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/icons_image_pathes.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_text_form_field.dart';
import '../../../trainee_features/preferences/presentation/views/preferences_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/trainee/forgot-password-screen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                'Forgot Password?',
                style: TextStyles.mainScreenTitle,
              ),
              const SizedBox(height: 16),
              const Text(
                'Don’t worry! it occurs. Please enter the email\n address linked with your account',
                style: TextStyles.baseRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 350,
                width: 350,
                child: SvgPicture.asset(forgotPassword),
              ),
              const SizedBox(height: 32),
              CustomTextFromField(
                subTitle: 'Email',
                hintText: 'yourname@gmail.com',
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'error';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 24),

              CustomAuthButton(
                text: "Send Code",
                isActive: true,
                onPressed: () {
                  Navigator.of(context).push(
                    PageSlideTransition(
                      const VerifyCodeScreen(),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
