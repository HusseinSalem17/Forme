import 'package:flutter/material.dart';
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
    this.color = Colors.black,
    this.size = 17,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
