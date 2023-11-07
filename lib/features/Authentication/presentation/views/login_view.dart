import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_footer.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_header.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sing_in_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingInHeader(),
                SignInBody(),
                Spacer(),
                SignInFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
