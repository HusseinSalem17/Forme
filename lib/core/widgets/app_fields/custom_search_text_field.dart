import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: TextFormField(
        focusNode: _focusNode,
        cursorColor: AppColors.primaryColor,
        style: TextStyles.textStyleRegular
            .copyWith(color: AppColors.n900Black, fontSize: 14.sp),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.5.h),
          hintText: 'Search Workout, Trainer',
          hintStyle:
              TextStyles.textStyleRegular.copyWith(fontSize: 16.sp, height: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n40BorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n40BorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          errorMaxLines: 1,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 5.w),
            child: SvgPicture.asset(
              'assets/image/Icon/search.svg',
              color: _isFocused
                  ? AppColors.primaryColor
                  : AppColors.n200BodyContentColor,
            ),
          ),
          prefixIconConstraints:
              BoxConstraints(minWidth: 20.w, minHeight: 20.h),
        ),
      ),
    );
  }
}
