import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomPasswordFromField extends StatefulWidget {
  final String hintText;
  final String subTitle;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;

  const CustomPasswordFromField({
    super.key,
    required this.hintText,
    required this.subTitle,
    this.onChange,
    this.inputFormats,
    this.textInputType,
    this.onEditingComplete,
  });

  @override
  State<CustomPasswordFromField> createState() =>
      _CustomPasswordFromFieldState();
}

class _CustomPasswordFromFieldState extends State<CustomPasswordFromField> {
  bool showPassword = false;

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
          widget.subTitle,
          style: subTitleStyle,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: !showPassword,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 11.5,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyles.textStyleRegular.copyWith(
                fontSize: 14,
              ),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )),
          onChanged: widget.onChange,
          inputFormatters: widget.inputFormats,
          onEditingComplete: widget.onEditingComplete,
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
