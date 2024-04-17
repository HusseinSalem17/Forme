import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/test_models/top_trainers_model.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/trainer_details_view.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/top_trainer_item.dart';

class TopTrainersList extends StatelessWidget {
  final void Function()? onTap;

  const TopTrainersList({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Trainers',
                style: TextStyles.largeBold,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'See all',
                  style: TextStyles.baseRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topTrainersData.length,
            itemBuilder: (
              BuildContext context,
              index,
            ) {
              return TopTrainerItem(index: index);
            },
          ),
        )
      ],
    );
  }
}
