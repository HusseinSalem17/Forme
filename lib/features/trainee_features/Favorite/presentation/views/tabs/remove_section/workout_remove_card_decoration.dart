import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/workout_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/remove_card_image.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/workout_card_type.dart';

class WorkoutRemoveCardDecoration extends StatelessWidget {
  const WorkoutRemoveCardDecoration(
      {super.key, required this.model, required this.size});
  final WorkoutCardModel model;
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
            RemoveCardImage(
                height: size.height / 2,
                width: size.width / 3,
                bottomPadding: 0,
                leftPaddingIcon: 110),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WorkoutCardType(
                        type: model.typeCard,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 14,
                        color: AppColors.starColor,
                      ),
                      Text(
                        model.reviews,
                        style: TextStyles.cardTextStyle.copyWith(
                            color: AppColors.n200Gray,
                            fontSize: 9,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Text(
                    model.title,
                    style: TextStyles.blackCardTextStyle,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/Icon/User.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.price,
                        style: TextStyles.cardTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (model.isBestSeller)
                        const WorkoutCardType(type: 'Best Seller')
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
