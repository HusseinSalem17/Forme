import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/coach_type_review.dart';

class FeaturedCardReview extends StatelessWidget {
  final String type;
  final double rating;
  final int review;

  const FeaturedCardReview({
    super.key,
    this.type = 'Yoga',
    this.rating = 4.9,
    this.review = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.n20Gray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  type,
                  style: TextStyles.baseRegular.copyWith(
                    fontSize: 8,
                    color: AppColors.primaryColor,
                  ),
                ),

              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star_rounded,
              size: 14,
              color: AppColors.starColor,
            ),
            Text(
              '$rating ($review Reviews)',
              overflow: TextOverflow.clip,
              style: TextStyles.cardTextStyle.copyWith(
                color: AppColors.n200Gray,
                fontSize: 9,
              ),
            )
          ],
        )
      ],
    );
  }
}
