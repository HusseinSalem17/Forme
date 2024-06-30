import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/show_snackbar.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_pin_code.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/preferences_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/trainer_preference_screen.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/loader.dart';
import '../manager/auth_bloc.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  static const routeName = '/verify-code-view';

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late TextEditingController otpController = TextEditingController();
  String email = '';
  String password = '';
  UserType userType = UserType.trainee;
  bool isSignUp = true;

  @override
  void dispose() {
    otpController.dispose(); // Dispose the controller
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
          size: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is VerifyOTPFailureSignUp) {
              customSnackBar(context, state.errMsg);
            }
            if (state is VerifyOTPSuccess) {
              if (state.isSignUp) {
                context.read<AuthBloc>().add(
                      SignUpEvent(
                        password1: password,
                        email: email,
                        userType: userType,
                      ),
                    );
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  NewPasswordScreen.routeName,
                );
              }
            }
            if (state is SignUpSuccess) {
              if(userType==UserType.trainee){
                Navigator.pushReplacementNamed(
                  context,
                  PreferencesScreen.routeName,
                );
              }
              else{
                Navigator.pushReplacementNamed(
                  context,
                  TrainerPreferenceScreen.routeName,
                );
              }

            }
          },
          builder: (context, state) {
            if (state is RequestOTPSuccessSignUp) {
              email = state.email;
              password = state.password;
              userType = state.userType!;
              isSignUp = true;
            }
            if (state is RequestOTPSuccessForForgetPassword) {
              email = state.email;
              isSignUp = false;
            }
            if (state is AuthLoading) {
              return const Loader();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verify Code',
                  style: TextStyles.mainScreenTitle,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Please enter the code we just sent to email',
                  style: TextStyles.baseRegular,
                ),
                Text(
                  email,
                  style: TextStyles.baseRegular.copyWith(
                    color: AppColors.greenColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: CustomPinCodeTextField(
                    context: context,
                    otpFiledController: otpController,
                  ),
                ),
                Text(
                  "Didn't receive OTP?",
                  style: TextStyles.baseRegular
                      .copyWith(color: AppColors.n100Gray),
                ),
                GestureDetector(
                  child: Text(
                    "Resend Code",
                    style: TextStyles.baseRegular.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                  onTap: () {
                    if (isSignUp) {
                      context.read<AuthBloc>().add(
                            RequestOTPForSignUpEvent(
                              email: email,
                              userType: userType,
                              password: password,
                            ),
                          );
                    } else {
                      context.read<AuthBloc>().add(
                            RequestOTPForForgetPasswordEvent(
                              email: email,
                            ),
                          );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: CustomAuthButton(
                    text: 'Verify',
                    isActive: true,
                    onPressed: () {
                      print('your email signup in verify screen is $email');
                      context.read<AuthBloc>().add(
                            VerifyOTPEvent(
                              otp: otpController.text.trim(),
                              email: email,
                              isSignUp: isSignUp,
                            ),
                          );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
