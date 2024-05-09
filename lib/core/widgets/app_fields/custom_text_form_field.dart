import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTextFromField extends StatelessWidget {
  final String hintText;
  final String subTitle;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  const CustomTextFromField({
    super.key,
    required this.hintText,
    required this.subTitle,
    this.onChange,
    this.inputFormats,
    this.textInputType,
    this.onEditingComplete,
    this.validator,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final subTitleStyle = TextStyles.textStyleSemiBold.copyWith(
      fontSize: 16,
      color: AppColors.n900Black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subTitle,
          style: subTitleStyle,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: textEditingController,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            hintText: hintText,
            hintStyle: TextStyles.textStyleRegular.copyWith(
              fontSize: 14,
            ),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder().copyWith(
              borderSide: const BorderSide(
                color: AppColors.d300Danger,
              ),
            ),
            focusedErrorBorder:  buildOutlineInputBorder().copyWith(
              borderSide: const BorderSide(
                color: AppColors.d300Danger,
              ),
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

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: AppColors.n40Gray),
    );
  }
}
