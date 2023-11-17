import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String title, hint, type;
  final String? error;
  final double topPadding, bottomPadding;

  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hint,
      required this.type,
      this.bottomPadding = 4.0,
      this.topPadding = 4.0,
      this.error});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.topPadding.h, bottom: widget.bottomPadding.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: Text(
              widget.title,
              style: Styles.textStyleBold14
                  .copyWith(color: AppColors.n900PrimaryTextColor),
            ),
          ),
          TextFormField(
            cursorColor: AppColors.p300PrimaryColor,
            style: Styles.textStyleRegular14
                .copyWith(color: AppColors.n900PrimaryTextColor),
            keyboardType: widget.type == 'password'
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: widget.type == 'password' && _obscureText,
            // obscureText: widget.keyboardType == TextInputType.visiblePassword &&
            //     _obscureText,

            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fillColor,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              hintText: widget.hint,
              hintStyle: Styles.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.dg),
                borderSide: const BorderSide(
                  color: AppColors.fillColor,
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
                      icon: _obscureText
                          ? SvgPicture.asset('assets/image/Icon/eye-off.svg')
                          : SvgPicture.asset('assets/image/Icon/eye.svg'),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
