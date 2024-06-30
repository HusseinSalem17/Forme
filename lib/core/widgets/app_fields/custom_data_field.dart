import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';
import 'package:forme_app/core/widgets/date_picker/app_date_picker.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/manager/cubit/trainer_complete_profile_cubit.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatefulWidget {
  const CustomDateField({super.key});

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  DateTime? date;
  String formattedDate = 'dd/MM/yyyy';
  @override
  Widget build(BuildContext context) {
    return CustomBuildForm(
        title: 'DOB',
        titleColor: AppColors.n900Black,
        optional: false,
        child: GestureDetector(
          onTap: () async {
            final DateTime? results = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AppDatePicker();
                });
            setState(() {
              date = DateTime.parse(results.toString());
              DateFormat formatter = DateFormat('dd/MM/yyyy');
              formattedDate = formatter.format(date!);
            });
           
            context.read<TrainerCompleteProfileCubit>().dateOfBirth =
                formattedDate;
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: AppColors.n40Gray),
              borderRadius: BorderRadius.circular(4.dg),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(formattedDate,
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
