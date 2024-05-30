import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/weight_slider.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
class PickYourWeightScreenBody extends StatelessWidget {
  const PickYourWeightScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 19.h,
          ),
          const Text(
            'What’s Your Weight?',
            style: TextStyles.heading4Bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'What’s Your Weight?',
            style: TextStyles.textStyleRegular.copyWith(
                color: AppColors.n70Gray,
                fontSize:14.sp
            ),
          ),
          SizedBox(
            height: 58.h,
          ),
          const WeightSlider(),
        ],
      ),
    );
  }
}
