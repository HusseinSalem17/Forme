import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/icons_image_pathes.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../local_storage_data/auth_local/tokens.dart';
import '../../../../../../local_storage_data/auth_local/user_type.dart';
import 'custom_search_widget.dart';
import 'map_popup_menu.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: Colors.black.withOpacity(0.5),
      pinned: true,
      expandedHeight: 120.h,
      backgroundColor: Colors.white,
      leadingWidth: 180.w,
      toolbarHeight: 60.h,
      actions: [
        GestureDetector(
          onTap: () {
            RegistrationDataLocal.clearUserType();
            UserTokenLocal.clearTokens();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 24),
            child: SvgPicture.asset(alarmIcon),
          ),
        ),
      ],
      leading: Container(
        margin: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyles.smallRegular.copyWith(
                color: AppColors.n200Gray,
                fontSize: 11.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h, bottom: 16.0.h),
              child: const MapPopupMenu(),
            ),
          ],
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.none,
          background: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomSearchWidget(),
              Container(
                height: 36.h,
                width: 46.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.dg),
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    filterIcon,
                    height: 6.h,
                    width: 14.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
