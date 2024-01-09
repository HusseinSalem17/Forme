import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Favorite/data/programs_card_model.dart';
import 'package:forme_app/features/Favorite/presentation/views/widgets/programs_card_type.dart';
import 'package:forme_app/features/Favorite/presentation/views/widgets/remove_card_image.dart';
import 'package:forme_app/features/Favorite/presentation/views/widgets/workout_card_type.dart';

class ProgramsRemoveCardDecoration extends StatelessWidget {
  const ProgramsRemoveCardDecoration({super.key, required this.model, required this.size});
  final ProgramsCardModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      height: size.height / 6.25,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RemoveCardImage(height: size.height / 2, width: size.width / 3, bottomPadding: 0, leftPaddingIcon: 110),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProgramsCardType(type: model.type, state: model.state),
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
                      )
                    ],
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
                  Row(
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