import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Trainer_ditails/data/models/trainer_icon_model.dart';

class TrainerIcon extends StatelessWidget {
  const TrainerIcon({super.key, required this.model});
  final TraineesIconModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.h,
          decoration: BoxDecoration(
              color: AppColors.n20FillBodyInSmallCardColor,
              borderRadius: BorderRadius.circular(30.dg)),
          child: Padding(
            padding: EdgeInsets.all(14.h),
            child: SvgPicture.asset('assets/image/Icon/${model.icon}.svg'),
          ),
        ),
        Text(
          model.number,
          style: Styles.textStyleBold
              .copyWith(fontSize: 12.sp, color: AppColors.p300PrimaryColor),
        ),
        Text(model.type, style: Styles.textStyleRegular.copyWith(fontSize: 9.sp))
      ],
    );
  }
}