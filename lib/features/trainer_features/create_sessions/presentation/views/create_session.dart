import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/screens/Availability.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/screens/session_settings.dart';

class CreateSessionScreen extends StatelessWidget {
  const CreateSessionScreen({super.key});
  static const String routeName = '/create_session_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Create Session',
            style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Text(
              'From Availability, you can set the days and times at which you will be available to meet your customers online. Then from Sessions Settings. Sessions will be created automatically when you press Update.',
              style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvailabilityScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/image/Icon/available.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Availability',
                        style: TextStyles.textStyleRegular
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvailabilityScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            const Divider(
              color: AppColors.n20Gray,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SessionSettingsScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/Icon/settings.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Session Settings',
                        style: TextStyles.textStyleRegular
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SessionSettingsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.n20Gray,
            ),
          ],
        ),
      ),
    );
  }
}
