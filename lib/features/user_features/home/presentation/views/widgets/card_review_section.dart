import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/home/presentation/views/widgets/type_and_state.dart';

class CardReviewSection extends StatelessWidget {
  CardReviewSection({
    super.key,
    this.type = 'Yoga',
    this.state = 'Online',
    this.rating = 4.9,
    this.review = 17,
  });
  String type;
  String state;
  double rating;
  int review;

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
              style: TextStyles.cardTextStyle.copyWith(
                color: AppColors.n200BodyContentColor,
                fontSize: 9,
              ),
            )
          ],
        )
      ],
    );
  }
}
