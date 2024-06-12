import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code_screen.dart';
import 'package:forme_app/features/authentication/presentation/views/sign_in_screen.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/auth_divider.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_check_box.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/icon_widget.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/slider_type_choice.dart';
import '../../../../core/transitions/page_slide.dart';
import '../../../../core/utils/check_box_bloc/checkbox_bloc.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_password_form_field.dart';
import '../../../../core/widgets/app_fields/custom_text_form_field.dart';
import '../../../../core/widgets/loader.dart';
import '../manager/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/trainee/Sing-up-screen';
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController password1Controller;
  late TextEditingController password2Controller;
  UserType selectedUserType = UserType.trainee;
  final _formKey = GlobalKey<FormState>(); // Key for the form

  @override
  void initState() {
    emailController = TextEditingController();
    password1Controller = TextEditingController();
    password2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    password1Controller.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.n900Black,
          size: 25, // Change the color of the AppBar icon
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RequestOTPSuccessSignUp) {
              Navigator.of(context).pushReplacementNamed(
                VerifyCodeScreen.routeName,
              );
            } else if (state is RequestOTPFailureSignUp) {
              customSnackBar(context, state.errMsg);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return SingleChildScrollView(
              child: Form(
                key: _formKey, // Assign the form key
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
                    SliderTypeChoice(
                      onUserTypeSelected: (UserType userType) {
                        selectedUserType = userType;
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
                        } else if (!SignUpEvent(email: val).isEmailValid()) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomPasswordFromField(
                        textEditingController: password1Controller,
                        subTitle: 'Password',
                        hintText: '***********',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Password is required';
                          } else if (!SignUpEvent(password1: val)
                              .isPasswordValid()) {
                            return 'Please enter a strong Password';
                          }
                          return null;
                        }),
                    const SizedBox(height: 16),
                    CustomPasswordFromField(
                        textEditingController: password2Controller,
                        subTitle: 'Confirm Password',
                        hintText: '***********',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Password is required';
                          } else if (!SignUpEvent(
                            password2: val,
                            password1: password1Controller.text.trim(),
                          ).isPasswordsMatch()) {
                            return 'Password don\'t match';
                          }
                          return null;
                        }),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<CheckboxBloc, CheckboxState>(
                          builder: (context, state) {
                            return CustomCheckbox(
                              value: state is CheckboxCheckedState,
                              onChanged: (newValue) {
                                context.read<CheckboxBloc>().add(ToggleCheckboxEvent());
                              },
                              checkColor: Colors.black,
                              borderColor: AppColors.n40Gray,
                              borderWidth: 2.0,
                              size: 16.0,
                            );
                          },
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
                      text: "Sign Up",
                      isActive: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final email = emailController.text;
                          final password1 = password1Controller.text;
                          context.read<AuthBloc>().add(
                            RequestOTPForSignUpEvent(
                              email: email,
                              userType: selectedUserType,
                              password: password1,
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
                            text: 'Already have an account? ',
                            style: TextStyles.baseRegular
                                .copyWith(color: AppColors.n500Color),
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
            );
          },
        ),
      ),
    );
  }
}