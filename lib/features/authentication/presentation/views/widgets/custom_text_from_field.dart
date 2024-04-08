import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String title, hint, type;
  final String? error;
  final double topPadding, bottomPadding;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hint,
    required this.type,
    this.onChanged,
    this.bottomPadding = 4.0,
    this.topPadding = 4.0,
    this.error,
  });

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
              style: TextStyles.textStyleBold
                  .copyWith(color: AppColors.n900Black,fontSize:14.sp),
            ),
          ),
          TextFormField(
            cursorColor: AppColors.primaryColor,
            style: TextStyles.textStyleRegular
                .copyWith(color: AppColors.n900Black,fontSize:14.sp),
            keyboardType: widget.type == 'password'
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: widget.type == 'password' && _obscureText,
            // obscureText: widget.keyboardType == TextInputType.visiblePassword &&
            //     _obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              hintText: widget.hint,
              hintStyle: TextStyles.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.dg),
                borderSide: const BorderSide(
                  color: AppColors.fillColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.dg),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
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