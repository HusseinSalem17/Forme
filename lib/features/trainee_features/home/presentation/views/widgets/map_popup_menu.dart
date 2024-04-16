import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
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
            mapIcon,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Port Said, EGY',
            style: TextStyles.baseRegular.copyWith(
              color: AppColors.n900Black,
            ),
          ),
          SvgPicture.asset(
            dropMenuIcon,
          ),
        ],
      ),
    );
  }
}
