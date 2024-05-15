import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/programs_card_type.dart';
import 'package:forme_app/features/trainee_features/search/data/sports_club_search_card_model.dart';
import 'package:forme_app/features/trainee_features/search/presentation/views/widgets/image_section.dart';

class SearchSportsClubTabCard extends StatelessWidget {
  const SearchSportsClubTabCard(
      {super.key, required this.size, required this.model});
  final Size size;
  final SportsClubSearchCardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
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
            width: size.width / 4,
            bottomPadding: 0,
            leftPaddingIcon: 110,
            id: model.id,
            category: model.category,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProgramsCardType(
                          type: model.typeCard, state: model.state),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 14.dg,
                            color: AppColors.starColor,
                          ),
                          Text(
                            model.reviews,
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200Gray,
                              fontSize: 11.sp,
                            ),
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
                    SvgPicture.asset('assets/image/Icon/pin-map.svg'),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0.w),
                      child: Text(
                        model.address,
                        style: TextStyles.cardTextStyle.copyWith(
                          color: AppColors.n100Gray,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      model.price,
                      style: TextStyles.cardTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      model.period,
                      style: TextStyles.cardTextStyle.copyWith(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.n200Gray),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
