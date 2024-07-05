import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomAppBarArrowButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final Color color;
  final double size;

  const CustomAppBarArrowButton({
    super.key,
    required this.onTap,
    this.icon = Icons.arrow_back_rounded,
    this.color = AppColors.n400color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,color: AppColors.n40Gray),
          borderRadius: BorderRadius.circular(16.dg),
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
          color: color,
          size: size,
        ),
      ),
      onPressed: onTap,
      //
    );
  }
}
