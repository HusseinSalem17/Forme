import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import '../../../features/trainee_features/home/presentation/views/custom_home_search_screen.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  CustomSearchTextFieldState createState() => CustomSearchTextFieldState();
}

class CustomSearchTextFieldState extends State<CustomSearchTextField> {
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
        onTap: () {
          showSearch(
            context: context,
            delegate: CustomSearchHomeScreen(),
          );
        },
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
              color: AppColors.n40Gray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n40Gray,
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
              color: _isFocused ? AppColors.primaryColor : AppColors.n200Gray,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 20.h,
          ),
        ),
      ),
    );
  }
}
