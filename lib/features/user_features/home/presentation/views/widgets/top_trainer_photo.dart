import 'package:flutter/material.dart';
import 'package:forme_app/core/test_models/top_trainers_model.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TopTrainerPhoto extends StatelessWidget {
  final int index;

  const TopTrainerPhoto({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                topTrainersData[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            topTrainersData[index].name,
            style: TextStyles.textStyleRegular
                .copyWith(fontSize: 12, color: AppColors.n900Black),
          )
        ],
      ),
    );
  }
}
