import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
                text: blackText,
                style: blackTextStyle,
              ),
              TextSpan(
                text: blueText,
                style: blueTextStyle,
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
    );
  }
}
