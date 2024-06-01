import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/Authentication/presentation/views/verify_code_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/icons_image_pathes.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_text_form_field.dart';
import '../../../../core/widgets/loader.dart';
import '../manager/auth_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/trainee/forgot-password-screen';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
            size: 25 // Change the color of the AppBar icon
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is RequestOTPSuccessForForgetPassword) {
                print('i will go to otp and i have the email in the state');
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
              return Column(
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
                    textEditingController: emailController,
                    subTitle: 'Email',
                    hintText: 'yourname@gmail.com',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter your email';
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
                      final email = emailController.text.trim();
                      context.read<AuthBloc>().add(
                            RequestOTPForForgetPasswordEvent(
                              email: email,
                            ),
                          );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
