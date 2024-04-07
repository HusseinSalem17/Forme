import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class MapPopupMenu extends StatelessWidget {
  const MapPopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: 'Option 1',
          child: Text('Port Said, EGY'),
        ),
        const PopupMenuItem(
          value: 'Option 2',
          child: Text('London'),
        ),
        const PopupMenuItem(
          value: 'Option 3',
          child: Text('paris'),
        ),
      ],
      onSelected: (value) {
        // Handle the user's selection here.
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/image/Icon/pin-map.svg',
            height: 24.h,
            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            'Port Said, EGY',
            style: TextStyles.textStyleRegular.copyWith(color: Colors.black, fontSize: 16.sp),
          ),
          SvgPicture.asset(
            'assets/image/Icon/chevron-down.svg',
          ),
        ],
      ),
    );
  }
}
