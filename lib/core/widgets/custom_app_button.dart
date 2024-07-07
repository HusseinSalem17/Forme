import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomAppButton extends StatefulWidget {
  final String title;
  final double widthDivider, height, padding, fontSize;
  final void Function()? onTap;
  final Color color, titleColor;
  final bool isShadow, isLoad;
  const CustomAppButton(
      {super.key,
      required this.title,
      this.onTap,
      this.widthDivider = 1,
      this.color = AppColors.primaryColor,
      this.titleColor = AppColors.background,
      this.height = 48,
      this.padding = 16,
      this.fontSize = 16,
      this.isShadow = true,
      this.isLoad = false});

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}

class _CustomAppButtonState extends State<CustomAppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        child: Container(
          height: widget.height.h,
          width: MediaQuery.sizeOf(context).width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.dg),
            color: widget.color,
            boxShadow: [
              widget.isShadow
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    )
                  : const BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 0,
                      offset: Offset(0, 0)),
            ],
          ),
          padding: EdgeInsets.all(widget.padding.h),
          child: widget.isLoad
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 2.85),
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: LoadingIndicator(
                      indicatorType: Indicator.circleStrokeSpin,
                      colors: [AppColors.background],
                      strokeWidth: 3,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    widget.title,
                    style: TextStyles.textStyleMedium.copyWith(
                        fontSize: widget.fontSize.sp,
                        color: widget.titleColor,
                        height: 1),
                  ),
                ),
        ),
      ),
    );
  }
}
