import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomPasswordFromField extends StatelessWidget {
  final String hintText;
  final String subTitle;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  const CustomPasswordFromField({
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
  build(BuildContext context) {
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
        SizedBox(height: 10.h),
        TextFormField(
          controller: textEditingController,
          validator: validator,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 11.5,
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
              focusedErrorBorder: buildOutlineInputBorder().copyWith(
                borderSide: const BorderSide(
                  color: AppColors.d300Danger,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              )),
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
