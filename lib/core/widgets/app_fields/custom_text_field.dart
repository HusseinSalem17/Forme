import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/functions/validators.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.confirmPasswordController,
      this.errorText,
      required this.hintStyle,
      required this.title,
      this.subTitle = '',
      this.optional = false,
      this.enabled = true,
      this.titleColor = AppColors.n900Black})
      : super(key: key);

  final void Function(String)? onChanged;
  final String? hintText, errorText;
  final String title, subTitle;
  final bool optional;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextEditingController? confirmPasswordController;
  final String? Function(String?)? validator;
  final Color titleColor;
  final bool enabled;
  final TextStyle hintStyle;
  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
      title: widget.title,
      subTitle: widget.subTitle,
      titleColor: widget.titleColor,
      optional: widget.optional,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primaryColor,
        enabled: widget.enabled,
        style: TextStyles.textStyleRegular
            .copyWith(fontSize: 14.sp, color: AppColors.n900Black),
        keyboardType: widget.keyboardType,
        obscureText: widget.keyboardType == TextInputType.visiblePassword &&
            _obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.enabled ? AppColors.background : AppColors.n20Gray,
          contentPadding: EdgeInsets.only(
            left: 0.w,
            top: 8.h,
            bottom: 8.h,
          ),
          prefix: Padding(
            padding: EdgeInsets.only(left: 16.w),
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          border: textFieldBorder(),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          errorBorder: textFieldBorder(
            color: AppColors.r200ErrorColor,
            width: 2.0,
          ),
          errorMaxLines: 1,
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
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
        onChanged: widget.onChanged,
        validator: widget.validator ??
            (value) {
              if (widget.keyboardType == TextInputType.emailAddress) {
                return validateEmail(value);
              } else if (widget.keyboardType == TextInputType.name) {
                return validateInput(value);
              }
              // else  if (widget.keyboardType == TextInputType.visiblePassword) {
              //   return validatePassword(value);
              // }
              else {
                return null;
              }
            },
      ),
    );
  }
}
