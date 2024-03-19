import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Favorite/data/programs_card_model.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/fav_image_section.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/programs_card_type.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/workout_card_type.dart';

class ProgramsTabCard extends StatelessWidget {
  const ProgramsTabCard({super.key, required this.size, required this.model});
  final ProgramsCardModel model;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      height: size.height / 6.25,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FavCardImageSection(height: size.height / 2, width: size.width / 4, bottomPadding: 0, leftPaddingIcon: 110, id: model.id, category: model.category),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProgramsCardType(type: model.type, state: model.state),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: AppColors.starColor,
                            ),
                            Text(
                              model.reviews,
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.n200BodyContentColor,
                                fontSize: 9,
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
                      SvgPicture.asset('assets/image/Icon/People.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          children: [
                            Text(
                              'Yous Clients: ',
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.n100Color,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              model.clientsNumber,
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.p300PrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              model.price,
                              style: TextStyles.cardTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              model.period,
                              style: TextStyles.cardTextStyle.copyWith(fontSize: 8, fontWeight: FontWeight.w400, color: AppColors.n200BodyContentColor),
                            ),
                          ],
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
      ),
    );
  }
}
