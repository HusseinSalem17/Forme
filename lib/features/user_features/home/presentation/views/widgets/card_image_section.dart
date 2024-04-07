import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class CardImageSection extends StatelessWidget {
  const CardImageSection({
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
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Stack(
        children: [
          SizedBox(
            height: height, //size.height / 3.75 / 2,
            width: width, //size.width / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/image/m.jpg',
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
// const Padding(
//             padding: EdgeInsets.only(top: 7, right: 7),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: CircleAvatar(
//                 radius: 10,
//                 backgroundColor: Colors.white,
//                 child: Icon(
//                   Icons.favorite_border,
//                   color: AppColors.p300PrimaryColor,
//                   size: 15,
//                 ),
//               ),
//             ),
//           ),