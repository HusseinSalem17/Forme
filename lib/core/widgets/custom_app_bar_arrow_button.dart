import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomAppBarArrowButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomAppBarArrowButton(
      {super.key, required this.onTap, this.icon = Icons.arrow_back_rounded});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Container(
        width: 32.h,
        height: 32.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
      onPressed: onTap,
      //
    );
  }
}
