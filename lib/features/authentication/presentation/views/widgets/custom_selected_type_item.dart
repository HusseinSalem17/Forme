import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomSelectedType extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  final void Function()? onTap;

  const CustomSelectedType({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: TextStyles.smallBold.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
