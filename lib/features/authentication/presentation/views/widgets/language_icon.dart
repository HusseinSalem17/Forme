import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LanguageIcon extends StatelessWidget {
  final String language, url;
  final void Function()? onTap;

  const LanguageIcon({
    super.key,
    required this.language,
    required this.onTap,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(language),
            SizedBox(
              width: 10.w,
            ),
            SvgPicture.asset(url),
          ],
        ),
      ),
    );
  }
}
