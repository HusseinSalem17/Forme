import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String iconUrl;
  final double height,width;
  const CustomButton({
    super.key,
    required this.iconUrl,
    this.height = 48,
    this.width =48

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(48.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.n50dropShadowColor.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset("assets/image/Icon/$iconUrl.svg"),
      ),
    );
  }
}
