import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'custom_radio_list_tile.dart';

class PickYourLevelScreenBody extends StatefulWidget {
  const PickYourLevelScreenBody({Key? key}) : super(key: key);

  @override
  State<PickYourLevelScreenBody> createState() =>
      _PickYourLevelScreenBodyState();
}

List<String> options = [
  'Beginner',
  'Intermediate',
  'Advanced',
];

class _PickYourLevelScreenBodyState extends State<PickYourLevelScreenBody> {
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
            'Your regular physical \n activity level? ',
            style: Styles.heading4Bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This helps us create your personalized plan',
            style: Styles.textStyleRegular14.copyWith(
              color: AppColors.n70HintColor,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
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
