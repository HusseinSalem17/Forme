import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class DrobDownMenuButton extends StatelessWidget {
  final double topPadding, bottomPadding;
  final String dropDownValue, title;
  final List<String> dropDownItems;
  final ValueChanged<String> onDropDownValueChanged;

  const DrobDownMenuButton({
    Key? key,
    this.bottomPadding = 4.0,
    this.topPadding = 4.0,
    required this.dropDownValue,
    required this.dropDownItems,
    required this.onDropDownValueChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding.h,
        bottom: bottomPadding.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0.h,),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Styles.textStyleBold14.copyWith(
                color: AppColors.n900PrimaryTextColor,
              ),
            ),
          ),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.n900PrimaryTextColor,
              ),
              borderRadius: BorderRadius.circular(4.dg),
            ),
            child: SizedBox(
              width: 342.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton2(
                  underline: Container(),
                  iconStyleData: IconStyleData(
                    icon: const Icon(Icons.expand_more_rounded),
                    iconSize: 24.sp,
                  ),
                  items: dropDownItems.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: AppColors.n900PrimaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                            
                    onDropDownValueChanged(newValue!);
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 80.h,
                    width: 285.w,
                  ),
                  dropdownStyleData: DropdownStyleData(  
                    maxHeight: 200.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.sp),
                      thickness: MaterialStateProperty.all(4.sp),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 40.h,
                  ),
                  value: dropDownValue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
