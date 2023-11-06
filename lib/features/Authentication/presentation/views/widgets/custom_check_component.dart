import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomCheckComponent extends StatelessWidget {
  final String url, title;
  final Color color;

  final void Function()? onTap;
  const CustomCheckComponent(
      {super.key,
      required this.url,
      required this.title,
      required this.onTap,
      this.color = AppColors.n80NavColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            url,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(title, style: Styles.textStyleBold16.copyWith(color: color))
        ],
      ),
    );
  }
}
