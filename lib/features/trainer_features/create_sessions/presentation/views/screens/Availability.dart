import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/screens/session_settings.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/Expandable_container.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Availability',
            style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(children: [
        Center(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 48.h,
                color: AppColors.p50PrimaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: GestureDetector(
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
                            SvgPicture.asset(
                              'assets/image/Icon/settings.svg',
                              color: AppColors.n900Black,
                            ),
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
                                builder: (context) =>
                                    const SessionSettingsScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(child: ExpandableContainerScreen()),
              SizedBox(height: 100.h),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonContainer(
            buttonTitle: 'Update',
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
