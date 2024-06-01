import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_in_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_fields/custom_password_form_field.dart';
import '../../../../core/widgets/loader.dart';
import '../manager/auth_bloc.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  static const routeName = '/trainee/new-password-view';

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController password1;
  late TextEditingController password2;
  String email = '';

  @override
  void initState() {
    password1 = TextEditingController();
    password2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password1.dispose();
    password2.dispose();
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SetNewPasswordFailure) {
              customSnackBar(context, state.errMsg);
            }
            if (state is SetNewPasswordSuccess) {
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            if (state is VerifyOTPSuccess) {
              print('ia am on the correct state');
              email = state.email;
            }
            return SingleChildScrollView(
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
                    textEditingController: password1,
                    subTitle: 'Password',
                    hintText: '********',
                  ),
                  const SizedBox(height: 16),
                  CustomPasswordFromField(
                    textEditingController: password2,
                    subTitle: 'Re-Enter Password',
                    hintText: '********',
                  ),
                  const SizedBox(height: 32),
                  CustomAuthButton(
                    text: "Create New Password",
                    isActive: true,
                    onPressed: () {
                      final String password = password1.text.trim();
                      print('your email is $email');
                      context.read<AuthBloc>().add(
                            SetNewPasswordEvent(
                              email: email,
                              password: password,
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
