import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home/presentation/views/widgets/type_and_state.dart';

class CardReviewSection extends StatelessWidget {
  const CardReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TypeAndState(
          type: 'Yage',
          state: 'Online Coaching',
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
              '4.9 (17 Reviews)',
              style: Styles.cardTextStyle.copyWith(
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
