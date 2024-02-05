import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/functions/validators.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class LinksTextField extends StatefulWidget {
  const LinksTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.errorText,
    this.logo,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? hintText, errorText, logo;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  LinksTextFieldState createState() => LinksTextFieldState();
}

class LinksTextFieldState extends State<LinksTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.p300PrimaryColor,
      style: TextStyles.textStyleRegular
          .copyWith(
            fontSize: 14.sp,
          )
          .copyWith(color: AppColors.n900PrimaryTextColor),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(
          left: 0.w,
          top: 8.h,
          bottom: 8.h,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyles.hintStyle,
        border: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(
          color: AppColors.p300PrimaryColor,
          width: 2.0,
        ),
        errorBorder: textFieldBorder(
          color: AppColors.r200ErrorColor,
          width: 2.0,
        ),
        errorMaxLines: 1,
        errorText: widget.errorText,
        prefixIcon: SvgPicture.asset(
          'assets/image/profile/${widget.logo}.svg',
          fit: BoxFit.none,
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator ??
          (value) {
            validateEmail(value);
            return null;
          },
    );
  }
}
