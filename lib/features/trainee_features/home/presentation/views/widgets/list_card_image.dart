import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class ListCardImage extends StatelessWidget {
  const ListCardImage({
    super.key,
    required this.height,
    required this.width,
    this.bottomPadding = 8,
    this.leftPaddingIcon = 140,
    this.topPaddingIcon = 5,
    required this.imageUrl,
  });

  final double height, width, bottomPadding, topPaddingIcon, leftPaddingIcon;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Stack(
        children: [
          SizedBox(
            height: height, //size.height / 3.75 / 2,
            width: width, //size.width / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: topPaddingIcon.w,
            left: leftPaddingIcon.h,
            child: const CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border,
                color: AppColors.primaryColor,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
