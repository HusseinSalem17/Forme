import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';

Container clubTrainerCard(BuildContext context) {
  return Container(
    height: MediaQuery.sizeOf(context).height / 7,
    width: double.maxFinite,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.dg),
        color: AppColors.fillColor,
        border: Border.all(color: AppColors.n20Gray)),
    padding: EdgeInsets.all(6.w),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.dg),
          child: Image.asset(
            'assets/image/temp/Frame0.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 19.h,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.dg),
                color: AppColors.fillColor,
                border: Border.all(color: AppColors.n20Gray)),
            padding: EdgeInsets.all(8.h),
            child: Row(
              children: [
                SvgPicture.asset('assets/image/Icon/verified.svg'),
                const SizedBox(
                  width: 6,
                ),
                Text('Professional Trainer',
                    style: TextStyle(
                        fontSize: 11.sp, color: AppColors.primaryColor)),
              ],
            ),
          ),
          Text(
            'Ahmed Ramy',
            style: TextStyles.textStyleRegular
                .copyWith(fontSize: 14.sp, color: AppColors.n900Black),
          ),
          Text(
            'Trainer',
            style: TextStyles.textStyleRegular.copyWith(
              fontSize: 12.sp,
            ),
          ),
          Row(
            children: [
              // SimpleStarRating(
              //   allowHalfRating: true,
              //   starCount: 5,
              //   rating: 3.5,
              //   size: 16,
              //   spacing: 2,
              // ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '3.5',
                style: TextStyles.textStyleRegular
                    .copyWith(fontSize: 11.sp, color: AppColors.n900Black),
              ),
              Text(
                ' | ',
                style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 11.sp,
                ),
              ),
              Text(
                '20 Reviews',
                style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 11.sp,
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      SvgPicture.asset('assets/image/Icon/heart_sold.svg'),
    ]),
  );
}
