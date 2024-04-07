import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class GenderCheckButton extends StatefulWidget {
  final bool isChecked;
  final String icon, gender;
  final Function(bool)? onChanged;

  const GenderCheckButton(
      {Key? key,
      this.isChecked = false,
      this.onChanged,
      required this.gender,
      required this.icon})
      : super(key: key);

  @override
  _GenderCheckButtonState createState() => _GenderCheckButtonState();
}

class _GenderCheckButtonState extends State<GenderCheckButton> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          if (widget.onChanged != null) {
            widget.onChanged!(_isChecked);
          }
        });
      },
      child: _isChecked
          ? Container(
              width: MediaQuery.sizeOf(context).width / 2.6,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  border:
                      Border.all(width: 2, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(4.dg)),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                  child:
                      SvgPicture.asset('assets/image/Icon/${widget.icon}.svg'),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  widget.gender,
                  style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp, color: AppColors.primaryColor),
                )
              ]),
            )
          : Container(
              width: MediaQuery.sizeOf(context).width / 2.6,
              decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(width: 1, color: AppColors.n40BorderColor),
                  borderRadius: BorderRadius.circular(4.dg)),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      AppColors.n900Black, BlendMode.srcIn),
                  child:
                      SvgPicture.asset('assets/image/Icon/${widget.icon}.svg'),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  widget.gender,
                  style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp, color: AppColors.n900Black),
                )
              ]),
            ),
    );
  }
}
