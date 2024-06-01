import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import 'age_slider.dart';

class PickYourAgeScreenBody extends StatelessWidget {
  const PickYourAgeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 19.h,
          ),
          const Text(
            'How Old Are You?',
            style: TextStyles.heading4Bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This helps us create your personalized plan',
            style: TextStyles.textStyleRegular
                .copyWith(color: AppColors.n70Gray, fontSize: 14.sp),
          ),
          SizedBox(
            height: 58.h,
          ),
          const AgeSlider(),
        ],
      ),
    );
  }
}
