import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/workout_card_type.dart';
import 'package:forme_app/features/trainee_features/search/data/workout_search_card_model.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/widgets/image_section.dart';


class SearchWorkoutTabCard extends StatelessWidget {
  const SearchWorkoutTabCard({
    super.key,
    required this.size,
    required this.model,
  });
  final WorkoutSearchCardModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h, left: 24.0.h),
      width: size.width,
      height: size.height / 6,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: AppColors.n50dropShadowColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 1,
          ),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CardImageSection(
            height: size.height / 2,
            width: size.width / 5,
            bottomPadding: 0,
            leftPaddingIcon: 110,
            id: model.id,
            category: model.category,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WorkoutCardType(
                        type: model.typeCard,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 14.h,
                            color: AppColors.starColor,
                          ),
                          Text(
                            model.reviews,
                            style: TextStyles.cardTextStyle.copyWith(color: AppColors.n200Gray, fontSize: 9, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  model.title,
                  style: TextStyles.blackCardTextStyle,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/image/Icon/User.svg'),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0.h),
                      child: Text(
                        model.trainerName,
                        style: TextStyles.cardTextStyle.copyWith(
                          color: AppColors.n100Gray,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.price,
                        style: TextStyles.cardTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (model.isBestSeller) const WorkoutCardType(type: 'Best Seller')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
