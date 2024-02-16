import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class RemoveCardImage extends StatelessWidget {
  const RemoveCardImage({
    super.key,
    required this.height,
    required this.width,
    this.bottomPadding = 8,
    this.leftPaddingIcon = 130,
    this.topPaddingIcon = 5,
  });

  final double height, width, bottomPadding, topPaddingIcon, leftPaddingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding.h),
      child: Stack(
        children: [
          SizedBox(
            height: height.h,
            width: width.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/image/workout_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: topPaddingIcon,
            left: leftPaddingIcon,
            child: CircleAvatar(
              radius: 10.dg,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.favorite,
                color: AppColors.p300PrimaryColor,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
