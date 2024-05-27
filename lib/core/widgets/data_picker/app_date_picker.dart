import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime _selectedDate = DateTime.now();

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: Text('Select Date',
          style: TextStyles.textStyleRegular.copyWith(color: Colors.black)),
      content: DatePickerWidget(
        looping: false, // default is not looping
        firstDate: DateTime(1950),
        lastDate: DateTime(2024, 1, 1),
        initialDate: DateTime(2002, 2, 18),
        dateFormat: 'dd/MM/yyyy',
        locale: DatePicker.localeFromString('en-us'),
        onChange: (DateTime newDate, _) {
          setState(() {
            _selectedDate = newDate;
          });
        },
        pickerTheme: const DateTimePickerTheme(
          backgroundColor: Colors.transparent,
          itemTextStyle: TextStyle(color: AppColors.n900Black, fontSize: 19),
          dividerColor: AppColors.primaryColor,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: _submit,
              child: Text(
                'OK',
                style: TextStyles.textStyleSemiBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            TextButton(
              onPressed: _cancel,
              child: Text(
                'Cancel',
                style: TextStyles.textStyleSemiBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
