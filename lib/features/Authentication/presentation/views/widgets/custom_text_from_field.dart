import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String title, hint, type;
  final String? error;

  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hint,
      required this.type,
      this.error});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Text(
              widget.title,
              style: Styles.textStyleBold16
                  .copyWith(color: AppColors.n900PrimaryTextColor),
            ),
          ),
          TextFormField(
            cursorColor: AppColors.p300PrimaryColor,
            style: Styles.hintStyle,
            keyboardType: widget.type == 'password'
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: widget.type == 'password' && _obscureText,
            // obscureText: widget.keyboardType == TextInputType.visiblePassword &&
            //     _obscureText,

            decoration: InputDecoration(
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              hintText: widget.hint,
              hintStyle: Styles.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.dg),
                borderSide: const BorderSide(
                  color: AppColors.n100Color,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.dg),
                borderSide: const BorderSide(
                  color: AppColors.p300PrimaryColor,
                ),
              ),
              errorMaxLines: 1,
              suffixIcon: widget.type == 'password'
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: SvgPicture.asset('assets/image/Icon/eye-off.svg'),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
