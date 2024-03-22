import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomSearchTextField extends StatefulWidget {
  final bool isSearchScreen;

  const CustomSearchTextField({super.key, this.isSearchScreen = false});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    _focusNode.addListener(() {
      setState(() {});
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
      width: widget.isSearchScreen ? 280.w : 300.w,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        cursorColor: AppColors.p300PrimaryColor,
        style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 14.sp),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.background,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          hintText: 'Search..',
          hintStyle: TextStyles.textStyleRegular.copyWith(fontSize: 16.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n30StrokeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.n30StrokeColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.dg),
            borderSide: const BorderSide(
              color: AppColors.p300PrimaryColor,
            ),
          ),
          errorMaxLines: 1,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 5.w),
            child: SvgPicture.asset('assets/image/Icon/search.svg', color: _focusNode.hasFocus ? AppColors.p300PrimaryColor : AppColors.n200BodyContentColor,),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
          suffixIcon: _controller.text.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(left: 12.0.w, right: 12.w),
                  child: IconButton(
                    icon: Icon(Icons.cancel_outlined, color: AppColors.p300PrimaryColor, size: 18.spMax),
                    onPressed: () {
                      // clear search text
                      setState(() {
                        _controller.clear();
                      });
                    },
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
        ),
      ),
    );
  }
}
