import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/password_manager.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/widgets/pop_up.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/widgets/profile_feature.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> features = [
      'Notification Settings',
      'Password Manager',
      'Change Language',
      'Delete Account',
    ];
    final List<String> icons = [
      'settings-notification',
      'password-manager',
      'languages',
      'garbage',
    ];
    return Scaffold(
        appBar: simpleAppBar(context, 'Settings'),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
                children: List<Widget>.generate(4, (int index) {
              return profileFeature(icons[index], features[index], () {
                switch (index) {
                  case 0: //notifcation
                  case 1:
                    Navigator.of(context)
                        .push(PageSlideTransition(const PasswordManager()));
                  case 2: //change language
                  case 3:
                    popUp(
                      context,
                      'Delete Account',
                      'Are you sure you want to delete this account?',
                      'Yes, Delete',
                    );
                }
              },
                  index != 3
                      ? AppColors.n900PrimaryTextColor
                      : AppColors.d300Danger);
            })),
          ),
        ));
  }
}
