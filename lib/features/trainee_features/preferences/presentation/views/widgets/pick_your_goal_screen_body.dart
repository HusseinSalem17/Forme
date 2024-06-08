import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'custom_radio_list_tile.dart';

class PickYourGoalScreenBody extends StatefulWidget {
  const PickYourGoalScreenBody({Key? key}) : super(key: key);

  @override
  State<PickYourGoalScreenBody> createState() => _PickYourGoalScreenBodyState();
}

List<String> options = [
  'Get Fitter',
  'Gain Weight',
  'Lose Weight',
  'Building Muscles',
  'Improve Endurance',
  'Learn The Basics',
];

class _PickYourGoalScreenBodyState extends State<PickYourGoalScreenBody> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 19.h,
          ),
          const Text(
            'What’s Your Goal?',
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
          SizedBox(
            height: 450,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: CustomRadioListTile(
                    title: options[index].toString(),
                    value: options[index],
                    groupValue: currentOption,
                    onChanged: (String? value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
