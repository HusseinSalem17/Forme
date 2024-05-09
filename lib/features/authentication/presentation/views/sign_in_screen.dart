import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/icon_widget.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_button_scanface.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/language_icon.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/slider_type_choice.dart';

import '../../../../core/transitions/page_slide.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/icons_image_pathes.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_password_form_field.dart';
import '../../../../core/widgets/app_fields/custom_text_form_field.dart';
import '../../../trainee_features/preferences/presentation/views/preferences_screen.dart';
import '../manager/auth_bloc.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/trainee/singing-screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late UserType selectedUserType;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          LanguageIcon(
            url: "assets/image/Icon/egypt-flag.svg",
            language: 'العربية',
            onTap: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                // Navigate to PreferencesScreen on successful authentication
                Navigator.of(context).push(
                  PageSlideTransition(
                    const PreferencesScreen(),
                  ),
                );
              } else if (state is SignInFailure) {
                // Show error message if authentication fails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMsg)),
                );
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyles.mainScreenTitle,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hi! Welcome back, you’ve missed',
                    style: TextStyles.baseRegular,
                  ),
                  const SizedBox(height: 32),
                  SliderTypeChoice(
                    onUserTypeSelected: (UserType userType) {
                      // Callback function triggered when user selects a type
                      setState(() {
                        selectedUserType = userType;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomTextFromField(
                    textEditingController: emailController,
                    subTitle: 'Email',
                    hintText: 'yourname@gmail.com',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomPasswordFromField(
                    textEditingController: passwordController,
                    subTitle: 'Password',
                    hintText: '********',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password is required';
                      } else if (val.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.baseRegular.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageSlideTransition(
                            const ForgotPasswordScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomAuthButton(
                    text: "Sign In",
                    isActive: true,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Dispatch LoginEvent with email and password
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
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
                        },
                      ),
                      iconWidget(
                        width: 11,
                        height: 20,
                        iconName: facebookIcon,
                        onTap: () {
                          print('pressed');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyles.baseRegular.copyWith(
                            color: AppColors.n500Color,
                          ),
                        ),
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
                                  const SignUpScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomButtonScanFace(
                      icon: 'scanFace',
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ), // Use SignInForm widget
        ),
      ),
    );
  }
}
