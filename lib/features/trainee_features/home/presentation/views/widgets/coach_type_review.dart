import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CoachTypeReview extends StatelessWidget {
  final String type, state;
  final Color stateColor;

  const CoachTypeReview({
    super.key,
    required this.type,
    required this.state,
    this.stateColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                width: 0.5,
                height: 9,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'Online Coaching',
              style: TextStyles.baseRegular.copyWith(
                fontSize: 8,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
