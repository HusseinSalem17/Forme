import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/transitions/search_transition.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/icons_image_pathes.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../custom_home_search_screen.dart';
import 'new_searcj.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchHomeScreen(),
        );
      },
      child: Container(
        height: 36.h,
        width: 252.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.n40Gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.33.w),
          child: Row(
            children: [
              SvgPicture.asset(
                searchIcon,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Search Workout, Trainer',
                style: TextStyles.baseRegular.copyWith(
                  fontSize: 16,
                  color: AppColors.n100Gray,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
