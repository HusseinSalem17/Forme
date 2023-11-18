import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import 'buttons/skip_button.dart';


class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
    required this.titleStyle1,
    required this.titleStyle2,
  });

  final String image, title1, title2, description;
  final TextStyle titleStyle1, titleStyle2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 37.h, right: 24.w, left: 24.w),
      child: Column(
        children: [
          const SkipButton(),
          const Spacer(flex: 2),
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(flex: 2),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title1,
                  style: titleStyle1,
                ),
                TextSpan(
                  text: title2,
                  style: titleStyle2,
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: Styles.textStyleMedium12,
                ),
              ],
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
