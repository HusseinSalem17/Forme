import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/test_models/top_trainers_model.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TopTrainersSection extends StatelessWidget {
  const TopTrainersSection({Key? key}) : super(key: key);

  String truncateText(String text, int maxLength) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}..';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Trainers',
                style: Styles.textStyleBold.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize:14.sp,
                  color: AppColors.neutralsN9,
                ),
              ),
              Text(
                'See all',
                style: Styles.textStyleRegular.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize:14.sp,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topTrainersData.length,
            itemBuilder: (BuildContext context, index) {
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
                      truncateText(topTrainersData[index].name, 8),
                      style: Styles.textStyleRegular
                          .copyWith(fontSize: 12, color: AppColors.neutralsN9),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}