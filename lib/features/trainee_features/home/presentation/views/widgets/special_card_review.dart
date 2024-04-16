import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/type_and_state.dart';

class SpecialCardReview extends StatelessWidget {
  final String type;
  final String state;
  final double rating;
  final int review;

  const SpecialCardReview({
    super.key,
    this.type = 'Yoga',
    this.state = 'Online',
    this.rating = 4.9,
    this.review = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TypeAndState(
          type: type,
          state: state,
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
