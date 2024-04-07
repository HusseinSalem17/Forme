import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/new_password_screen.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_pin_code.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/header_text.dart';

import '../../../../core/utils/text_styles.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  static const routeName = '/verify-code-view';

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
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
        child: Column(
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
              'kemo@email.com',
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
              style: TextStyles.baseRegular.copyWith(color: AppColors.n100Gray),
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
                //resend code
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: CustomAuthButton(
                text: 'Verify',
                isActive: true,
                onPressed: () {
                  Navigator.of(context)
                      .push(PageSlideTransition(const NewPasswordScreen()));
                  //Navigator.pushNamed(context, NewPasswordScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
