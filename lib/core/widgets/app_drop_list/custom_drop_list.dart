import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/custom_build_form.dart';

class CustomDropList extends StatefulWidget {
  final String title;
  final double topPadding, bottomPadding;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? hint;
  final bool enabled;
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
    this.enabled = true,
  });

  @override
  State<CustomDropList> createState() => _CustomDropList();
}

class _CustomDropList extends State<CustomDropList> {
  String? _selectedValue;
  @override
  void initState() {
    super.initState();
    // Set the default selected value here
    _selectedValue = widget.items.isNotEmpty ? widget.items[0].value : null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
      title: widget.title,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyles.textStyleMedium.copyWith(
          color: AppColors.n900PrimaryTextColor,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(right: 16, top: 8.h, bottom: 8.h),
          border: textFieldBorder(),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(
            color: AppColors.p300PrimaryColor,
            width: 2,
          ),
          errorBorder: textFieldBorder(
            color: AppColors.r200ErrorColor,
            width: 2,
          ),
        ),
        hint: widget.hint,
        items: widget.items,
        validator: widget.validator,
        onChanged: widget.enabled ? (value) => _onDropdownChanged(value) : null,
        onSaved: widget.onSaved,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(
            FontAwesomeIcons.chevronDown,
            color: AppColors.p300PrimaryColor,
          ),
          icon: Icon(
            FontAwesomeIcons.chevronRight,
            color: AppColors.n70HintColor,
          ),
          iconSize: 16,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: AppColors.n100Color.withOpacity(0.25),
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
      ),
    );
  }

  void _onDropdownChanged(String? value) {
    setState(() {
      _selectedValue = value;
    });

    // Call the provided onChanged callback if available
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedValue);
    }
  }
}
