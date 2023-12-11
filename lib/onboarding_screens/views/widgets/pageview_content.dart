import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';
import 'buttons/skip_button.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    super.key,
    required this.image,
    required this.blackText,
    required this.blueText,
    required this.description,
    required this.blackTextStyle,
    required this.blueTextStyle,
    required this.context,
  });

  final BuildContext context;
  final String image, blackText, blueText, description;
  final TextStyle blackTextStyle, blueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SkipButton(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: 342.w,
            height: 400.h,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 64.h,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: blackText,
                style: blueTextStyle,
              ),
              TextSpan(
                text: blueText,
                style: blackTextStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: TextStyles.textStyleRegular.copyWith(
                    color: AppColors.n70HintColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
