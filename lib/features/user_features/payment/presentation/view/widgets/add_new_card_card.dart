import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

GestureDetector addNewCardCard(void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.n20FillBodyInBigCardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ), 
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 50.h,
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/image/Icon/visa.svg',
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Add New Card',
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14,
                      color: AppColors.n100Gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }