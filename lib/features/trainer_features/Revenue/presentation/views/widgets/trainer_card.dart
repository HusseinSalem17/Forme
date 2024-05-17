import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

Container trainerCard(BuildContext context, String name, String image,
    String state, String paymentMethod, String revenue, String time) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.dg),
          border: Border.all(width: 1.h, color: AppColors.n20Gray),
          color: AppColors.n10Color),
      padding: EdgeInsets.all(8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 58.h,
            width: 58.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(58.dg),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyles.textStyleRegular
                    .copyWith(fontSize: 14.sp, color: AppColors.n900Black),
              ),
              Row(
                children: [
                  Text(
                    state,
                    style: TextStyles.textStyleRegular.copyWith(
                        fontSize: 9.sp, color: AppColors.primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                        width: 1.5.h,
                        height: 9.h,
                        color: AppColors.n80NavColor),
                  ),
                  Text(
                    paymentMethod,
                    style: TextStyles.textStyleRegular
                        .copyWith(fontSize: 9.sp, color: AppColors.s400),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                revenue,
                style: TextStyles.textStyleRegular
                    .copyWith(fontSize: 14.sp, color: AppColors.s400),
              ),
              Text(
                time,
                style: TextStyles.textStyleRegular
                    .copyWith(fontSize: 11.sp, color: AppColors.n80NavColor),
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: AppColors.n100Gray,
          ),
        ],
      ));
}
