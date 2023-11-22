import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ImageUserProfile extends StatelessWidget {
  const ImageUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Stack(
          children: [
            CircleAvatar(
                radius: 60.0,
                backgroundColor: const Color(0xFFE6F0FF),
                child: SvgPicture.asset(
                  "assets/image/Icon/User_Avatar.svg",
                  width: 56.0.h,
                  height: 55.0.h,
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                    "assets/image/Icon/edit_pen.svg",
                    width: 24.sp,
                    height: 24.sp,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
