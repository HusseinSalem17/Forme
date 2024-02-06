import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/screens/cancellation_screen.dart';
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
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.n20FillBodyInSmallCardColor,
        ),
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
                    color: AppColors.n900PrimaryTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Video Call',
                  style: TextStyle(
                    color: AppColors.n100Color,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '15 Nov',
                  style: TextStyle(
                    color: AppColors.p300PrimaryColor,
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
                    color: AppColors.n100Color,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '7:00',
                      style: TextStyle(
                        color: AppColors.n900PrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' - ',
                      style: TextStyle(
                        color: AppColors.n900PrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '7:15',
                      style: TextStyle(
                        color: AppColors.n900PrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'AM',
                      style: TextStyle(
                        color: AppColors.n900PrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget.isCancelled
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.n100Color,
                        ),
                        color: AppColors.background,
                        surfaceTintColor: Colors.transparent,
                        position: PopupMenuPosition.under,
                        constraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            height: 35,
                            child: Text(
                              'Message',
                            ),
                          ),
                          const PopupMenuItem(
                            height: 35,
                            child: Text(
                              'View Profile',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.n100Color,
                        ),
                        color: AppColors.background,
                        surfaceTintColor: Colors.transparent,
                        position: PopupMenuPosition.under,
                        constraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            height: 35,
                            child: Text(
                              'Message',
                            ),
                          ),
                          const PopupMenuItem(
                            height: 35,
                            child: Text(
                              'View Profile',
                            ),
                          ),
                          PopupMenuItem(
                            height: 35,
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.d300Danger),
                            ),
                            onTap: () {
                              print('Cancel');
                              Navigator.of(context).push(PageSlideTransition(const CancellationScreen()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ));
  }
}
