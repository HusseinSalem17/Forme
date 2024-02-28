import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:readmore/readmore.dart';

class TrainerDescription extends StatelessWidget {
  const TrainerDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91.h,
      child: SingleChildScrollView(
        
        child: ReadMoreText(
          'Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere ',
          trimLines: 3,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: TextStyles.textStyleRegular.copyWith(
            fontSize: 12.sp,
          ),
          lessStyle: TextStyles.textStyleRegular.copyWith(
            fontSize: 12.sp,
            color: AppColors.p300PrimaryColor,
            decoration: TextDecoration.underline,
          ),
          moreStyle: TextStyles.textStyleRegular.copyWith(
            fontSize: 12.sp,
            color: AppColors.p300PrimaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}