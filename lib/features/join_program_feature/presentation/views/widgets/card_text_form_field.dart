import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
class CardTextFromField extends StatelessWidget {
  final String hintText;
  final String subTitle;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;

  const CardTextFromField({
    super.key,
    required this.hintText,
    required this.subTitle,
    this.onChange,
    this.inputFormats,
    this.textInputType,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    final subTitleStyle = TextStyles.textStyleSemiBold.copyWith(
      fontSize: 16,
      color: AppColors.neutralsN9,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          subTitle,
          style: subTitleStyle,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11.5,
            ),
            hintText: hintText,
            hintStyle: TextStyles.textStyleRegular.copyWith(
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.n40BorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.p300PrimaryColor),
            ),
          ),
          keyboardType: textInputType,
          onChanged: onChange,
          inputFormatters: inputFormats,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
