import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_botton.dart';

class CustomShadowButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? buttonTitle;
  final String? buttonSubTitle;
  final VoidCallback? subTitleOnTap;

  const CustomShadowButton({
    Key? key,
    required this.onTap,
    this.buttonTitle,
    this.buttonSubTitle,
    this.subTitleOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: buttonSubTitle != null ? 131.h : 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              splashColor: Colors.grey.withOpacity(1), // Add a splash color
              child: CustomAppBottom(
                title: buttonTitle ??
                    '', // Use the null-aware operator ?? to provide a default value
              ),
            ),
            if (buttonSubTitle !=
                null) // Perform a null check before using buttonSubTitle
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: GestureDetector(
                  onTap: subTitleOnTap ?? () {},
                  child: Text(
                    buttonSubTitle!,
                    style: TextStyles.textStyleRegular.copyWith(
                      color: AppColors.p300PrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
