import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/complete_your_profile/presentation/views/sections/complete_profile_body.dart';
import 'package:forme_app/complete_your_profile/presentation/views/sections/complete_profile_header.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/back_icon.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const routeName = '/Complete-profile-view';
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CompleteProfileHeader(
                    header: 'Complete Your Profile',
                    description:
                        'Don’t worry, only you can see your personal data. No one else will be able to see it',
                  ),
                  CompleteProfileBody()
                ],
              ),
            ),
          ),
        ));
  }
}
