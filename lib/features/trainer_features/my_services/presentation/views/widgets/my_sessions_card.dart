import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/widgets/custom_popup_menu.dart';

class MySessionsCard extends StatefulWidget {
  const MySessionsCard({super.key, this.isCancelled = false});
  final bool isCancelled;

  @override
  State<MySessionsCard> createState() => _MySessionsCardState();
}

class _MySessionsCardState extends State<MySessionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.n20FillBodyInSmallCardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.n50BackgroundColor,
                    child: SvgPicture.asset(
                      "assets/image/Icon/user_avatar.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hussein Salem',
                    style: TextStyle(
                      color: AppColors.n900Black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Video Call',
                    style: TextStyle(
                      color: AppColors.n100Gray,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '15 Nov',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Period',
                    style: TextStyle(
                      color: AppColors.n100Gray,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '7:00',
                        style: TextStyle(
                          color: AppColors.n900Black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' - ',
                        style: TextStyle(
                          color: AppColors.n900Black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '7:15',
                        style: TextStyle(
                          color: AppColors.n900Black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' AM',
                        style: TextStyle(
                          color: AppColors.n900Black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              widget.isCancelled
                  ? const CustomPopupMenu(isCancellation: true,)
                  : const CustomPopupMenu(),
            ],
          ),
        ));
  }
}
