import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/authentication/presentation/views/new_password.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/custom_pin_code.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/header_text.dart';

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
            color: AppColors.n900PrimaryTextColor,
            size: 25 // Change the color of the AppBar icon
            ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const HeaderText(
                title: 'Verify Code',
                subtitle: 'Please enter the code we just sent to email'),
            Text('example@email.com',
                style: TextStyles.descriptionStyle
                    .copyWith(color: AppColors.errorColor)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: CustomPinCodeTextField(
                context: context,
                otpFiledController: otpController,
              ),
            ),
            Text(
              "Didn't receive OTP?",
              style: TextStyles.textStyleRegular.copyWith(
                fontSize: 14.sp,
              ),
            ),
            GestureDetector(
              child: Text(
                "Resend Code",
                style: TextStyles.textStyleRegular.copyWith(
                  color: AppColors.p300PrimaryColor,
                  decoration: TextDecoration.underline,
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
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
          ]),
        ),
      ),
    );
  }
}
