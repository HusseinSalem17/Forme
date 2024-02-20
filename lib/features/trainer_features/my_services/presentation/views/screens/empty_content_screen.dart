import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/widgets/warning_notification.dart';

class EmptyContentScreen extends StatelessWidget {
  const EmptyContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.h, vertical: 32.0.h),
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: const Positioned(
                top: 0,
                child: WarningNotification(),
              ),
            ),
            SizedBox(
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 90.dg,
                    backgroundColor: AppColors.n40BorderColor,
                    child: CircleAvatar(
                      radius: 87.dg,
                      backgroundColor: AppColors.n10Color,
                      child: SvgPicture.asset(
                        'assets/image/icon/empty_content.svg',
                        width: 175.h,
                        height: 175.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Sorry, no content here!',
                    style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontWeight: FontWeight.w400, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
