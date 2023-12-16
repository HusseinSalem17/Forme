import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_and_up_header.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_footer.dart';
import 'package:forme_app/features/Authentication/presentation/views/sections/sign_in_body.dart';
import 'package:forme_app/features/authentication/presentation/views/widgets/language_icon.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/Sing-in-view';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LanguageIcon(
                    url: "assets/image/Icon/egypt-flag.svg",
                    language: 'العربيه',
                    onTap: () {},
                  ),
                  const SingInAndUpHeader(
                    header: 'SignIn',
                    description: 'Hi! Welcome back, you’ve missed',
                  ),
                  const SignInBody(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 10,
                  ),
                  const SignInFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
