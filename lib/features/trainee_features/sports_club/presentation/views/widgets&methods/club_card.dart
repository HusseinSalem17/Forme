import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/sports_club/data/models/club_card_model.dart';

class ClubCard extends StatelessWidget {
  final ClubCardModel model;

  final bool active;
  const ClubCard({
    super.key,
    this.active = false,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: Container(
        padding: active
            ? EdgeInsets.only(left: 21.w, bottom: 2.w, right: 2.w, top: 2.w)
            : EdgeInsets.only(left: 21.w),
        decoration: BoxDecoration(
          color: active ? AppColors.secondaryColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.dg),
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.dg),
                  topRight: Radius.circular(8.dg))),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.plan,
                style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 12.sp, color: AppColors.primaryColor),
              ),
              Row(
                children: [
                  Text(
                    '${model.time} - ',
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 14.sp, color: AppColors.n900Black),
                  ),
                  Text(
                    '${model.price}\$  ',
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 14.sp, color: AppColors.secondaryColor),
                  ),
                  Text(
                    model.offer,
                    style: TextStyles.textStyleBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
