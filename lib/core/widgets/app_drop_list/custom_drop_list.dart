import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';

class CustomDropList extends StatefulWidget {
  final String title;
  final double topPadding, bottomPadding;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? hint;
  final bool enabled;
  final Color titleColor;
  final String? initialValue; // Add this line

  final ValueNotifier<String?> selectedValueNotifier; // Add this line

  const CustomDropList({
    super.key,
    this.hint,
    this.bottomPadding = 4.0,
    this.topPadding = 4.0,
    required this.items,
    required this.title,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.titleColor = AppColors.n900Black,
    this.enabled = true,
    this.initialValue, // Add this line
    required this.selectedValueNotifier, // Add this line
  });

  @override
  State<CustomDropList> createState() => _CustomDropListState();
}

class _CustomDropListState extends State<CustomDropList> {
  @override
  void initState() {
    super.initState();
    widget.selectedValueNotifier.value = widget.initialValue; // Set the initial value
  }

  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
      title: widget.title,
      titleColor: widget.titleColor,
      child: ValueListenableBuilder<String?>(
        valueListenable: widget.selectedValueNotifier,
        builder: (context, selectedValue, child) {
          return DropdownButtonFormField2<String>(
            isExpanded: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.textStyleMedium.copyWith(
              color: AppColors.n900Black,
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(right: 16, top: 8.h, bottom: 8.h),
              border: textFieldBorder(),
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder(
                color: AppColors.primaryColor,
                width: 2,
              ),
              errorBorder: textFieldBorder(
                color: AppColors.r200ErrorColor,
                width: 2,
              ),
            ),
            hint: widget.hint,
            items: widget.items,
            value: selectedValue, // Bind the selected value to the dropdown
            validator: widget.validator,
            onChanged: widget.enabled
                ? (value) {
                    widget.selectedValueNotifier.value = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }
                  }
                : null,
            onSaved: widget.onSaved,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              openMenuIcon: Icon(
                FontAwesomeIcons.chevronDown,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                FontAwesomeIcons.chevronRight,
                color: AppColors.n70Gray,
              ),
              iconSize: 16,
            ),
            dropdownStyleData: DropdownStyleData(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.n100Gray.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            isDense: true, // Set to true to reduce the height
          );
        },
      ),
    );
  }
}