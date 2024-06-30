import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/functions/utils.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';
import 'package:forme_app/core/widgets/date_picker/app_date_picker.dart';


class CustomDateField extends StatefulWidget {
  const CustomDateField({
    super.key,
    this.enabled = true,
    this.initialDate,
    this.onChanged,
  });
  final bool enabled;
  final String? initialDate;
  final ValueChanged<String>? onChanged; // New parameter for onChanged callback

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  String date = 'DD/MM/YYYY';

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      date = widget.initialDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
        title: 'DOB',
        titleColor: AppColors.n900Black,
        optional: false,
        child: GestureDetector(
          onTap: () async {
            if (widget.enabled) {
              DateTime? result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AppDatePicker(
                      initialDate: widget.initialDate,
                    );
                  });
              if (result != null) {
                setState(() {
                  date = Utils().convertToString(result);
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(date); // Call the onChanged callback
                }
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.enabled ? AppColors.background : AppColors.n20Gray,
              border: Border.all(width: 1.0, color: AppColors.n40Gray),
              borderRadius: BorderRadius.circular(4.dg),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(date,
                    style: TextStyles.textStyleRegular
                        .copyWith(fontSize: 14.sp, color: AppColors.n900Black)),
                const Spacer(),
                const Icon(Icons.calendar_month_outlined),
              ],
            ),
          ),
        ));
  }
}
