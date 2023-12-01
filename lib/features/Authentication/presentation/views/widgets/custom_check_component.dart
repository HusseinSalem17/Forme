import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 56,
        child: Row(
          children: [
            SvgPicture.asset(
              url,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(title, style: Styles.textStyleBold.copyWith(color: color,fontSize:12.sp))
          ],
        ),
      ),
    );
  }
}
