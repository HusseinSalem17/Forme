import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/sections/vertical_list_of_items.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_list.dart';

class SpecialPrograms extends StatelessWidget {
  final void Function()? onTap;

  const SpecialPrograms({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Special Programs',
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
        const ProgramsCardList(),
      ],
    );
  }
}
