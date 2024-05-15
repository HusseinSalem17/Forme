import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class WorkoutCardType extends StatelessWidget {
  final String type;
  const WorkoutCardType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == 'Best Seller' ? AppColors.d100Danger : AppColors.n20Gray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: type == 'Best Seller'
            ? const EdgeInsets.symmetric(horizontal: 6, vertical: 4)
            : const EdgeInsets.all(4),
        child: Text(
          type,
          style: type == 'Best Seller'
              ? TextStyles.cardTextStyle.copyWith(color: AppColors.d50Danger)
              : TextStyles.cardTextStyle,
        ),
      ),
    );
  }
}
