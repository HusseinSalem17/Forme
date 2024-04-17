import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'package:forme_app/features/authentication/presentation/views/sign_in_screen.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_check_box.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/icon_widget.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/slider_type_choice.dart';
import '../../../../core/transitions/page_slide.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_password_form_field.dart';
import '../../../../core/widgets/app_fields/custom_text_form_field.dart';
import '../../../trainee_features/preferences/presentation/views/preferences_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/trainee/Sing-up-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool isChecked = false;

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
                'Create Account',
                style: TextStyles.mainScreenTitle,
              ),
              const SizedBox(height: 16),
              const Text(
                'Fill your information bellow or register\n with your social account',
                style: TextStyles.baseRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const SliderTypeChoice(),
              const SizedBox(height: 24),
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
              const SizedBox(height: 16),
              const CustomPasswordFromField(
                subTitle: 'Password',
                hintText: '********',
              ),
              const SizedBox(height: 16),
              const CustomPasswordFromField(
                subTitle: 'Confirm Password',
                hintText: '********',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckbox(
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue;
                      });
                    },
                    checkColor: Colors.black,
                    borderColor: AppColors.n40Gray,
                    borderWidth: 2.0,
                    size: 16.0,
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 280,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By continuing you accept our ',
                            style: TextStyles.smallRegular
                                .copyWith(color: AppColors.n100Gray),
                          ),
                          TextSpan(
                            text: 'Privacy Policy and Term of Use',
                            style: TextStyles.smallRegular
                                .copyWith(color: AppColors.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //privacy and policy screen
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomAuthButton(
                text: "Sign In",
                isActive: true,
                onPressed: () {
                  Navigator.of(context).push(
                    PageSlideTransition(
                      const PreferencesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const AuthDivider(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconWidget(
                      width: 20,
                      height: 20,
                      iconName: googleIcon,
                      onTap: () {
                        print('pressed');
                      }),
                  iconWidget(
                      width: 11,
                      height: 20,
                      iconName: facebookIcon,
                      onTap: () {
                        print('pressed');
                      }),
                ],
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyles.baseRegular
                            .copyWith(color: AppColors.n500Color)),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyles.baseRegular.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            PageSlideTransition(
                              const SignInScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
