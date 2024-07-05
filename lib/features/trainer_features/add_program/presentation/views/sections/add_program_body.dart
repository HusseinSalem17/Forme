import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/app_fields/program_capacity_field.dart';
import 'package:forme_app/core/widgets/import_media.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/select_gender_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/target_age_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/widgets/gender_chech_button.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/upload_file.dart';

class AddProgramBody extends StatefulWidget {
  const AddProgramBody(
      {super.key,
      required this.sportFieldNotifier,
      required this.levelNotifier,
      required this.typeNotifier,
      required this.titleController,
      this.minAgeController,
      this.maxAgeController,
      this.descriptionController,
      required this.genderNotifier});
  final TextEditingController titleController;
  final TextEditingController? minAgeController;
  final TextEditingController? maxAgeController;

  final ValueNotifier<String?> sportFieldNotifier;
  final ValueNotifier<String?> levelNotifier;
  final ValueNotifier<String?> typeNotifier;
  final TextEditingController? descriptionController;
  final void Function(String) genderNotifier;

  @override
  State<AddProgramBody> createState() => _AddProgramBodyState();
}

class _AddProgramBodyState extends State<AddProgramBody> {
  bool _isChecked = false;
  String? gender;
  //List<VideoDetails>? vedios;
  List<int> files = List<int>.generate(1, (int index) => index);
  final List<String> level = [
    'I am just staring',
    'I know the basics',
    'I know a lot',
    'I am a samurai'
  ];
  final List<String> type = [
    'Online',
    'Offline',
  ];
  final List<String> sportFieldItems = [
    'Fitness',
    'Football',
    'Tennis',
    'Swimming',
    'Basketball',
    'Volleyball',
    'Handball',
    'Running',
    'Cycling',
    'Boxing',
    'Yoga',
    'Pilates',
    'Dancing',
    'Golf',
    'Horse Riding',
    'Skiing',
    'Skating',
    'Surfing',
    'Sailing',
    'Bowling',
    'Billiards',
    'Chess',
    'Shooting'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        CustomTextField(
          title: 'Program Title',
          titleColor: AppColors.n400,
          hintText: 'Type here',
          hintStyle: TextStyles.hintStyle,
          controller: widget.titleController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Program title is required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        const ProgramCapacityField(),
        SizedBox(
          height: 16.h,
        ),
        CustomDropList(
          title: "Type", titleColor: AppColors.n400,
          hint: const Text('0'),
          items: type
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          selectedValueNotifier: widget.typeNotifier,
          // onChanged: (value) {
          //   onSportFieldChanged(value ?? '');
          // },
          onSaved: (value) {},
        ),
        SizedBox(height: 16.h),
        CustomDropList(
          title: "Sport Field", titleColor: AppColors.n400,
          hint: const Text('Select Sport Field'),
          items: sportFieldItems
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select sport field.';
            }
            return null;
          },
          selectedValueNotifier: widget.sportFieldNotifier,
          // onChanged: (value) {
          //   onSportFieldChanged(value ?? '');
          // },
          onSaved: (value) {},
        ),
        SizedBox(height: 16.h),
        CustomDropList(
          title: "Level ",
          titleColor: AppColors.n400,
          hint: const Text('Select Sport Field'),
          items: level
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select sport field.';
            }
            return null;
          },
          selectedValueNotifier: widget.levelNotifier,
          // onChanged: (value) {
          //   onSportFieldChanged(value ?? '');
          // },
          onSaved: (value) {},
        ),
        SizedBox(height: 16.h),
        TextArea(
            title: 'Description', controller: widget.descriptionController),
        SizedBox(
          height: 8.h,
        ),
        SelectGenderSection(onTap: widget.genderNotifier),
        const Divider(
          thickness: 1,
          color: AppColors.n40Gray,
        ),
        TargetAgeSection(
          firstController: widget.minAgeController ?? TextEditingController(),
          secondController: widget.maxAgeController ?? TextEditingController(),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.n40Gray,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/image/Icon/plans.svg'),
              SizedBox(
                width: 21.w,
              ),
              Text(
                'Payment Plans',
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 14.sp, color: AppColors.n900Black),
              )
            ],
          ),
        ),
                  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   paymentItems.add(paymentItems.length + 1);
                  // });
                },
                child: TextButton(
                  onPressed: () {},
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    radius: Radius.circular(10.dg),
                    color: AppColors.n40Gray,
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: SizedBox(
                        height: 48.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/image/Icon/add.svg'),
                            Text(
                              'Add New Plan',
                              style: TextStyles.textStyleRegular.copyWith(
                                  fontSize: 14.sp, color: AppColors.n900Black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          )
      ],
    );
  }
}


//           Column(
//             children: List<Widget>.generate(paymentItems.length, (int index) {
//               return PaymentPlanItem(
//                 onTap: () {
//                   setState(() {
//                     paymentItems.removeAt(index);
//                   });
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     paymentItems.add(paymentItems.length + 1);
//                   });
//                 },
//                 child: TextButton(
//                   onPressed: () {},
//                   child: DottedBorder(
//                     borderType: BorderType.RRect,
//                     strokeWidth: 2,
//                     radius: Radius.circular(10.dg),
//                     color: AppColors.n40Gray,
//                     padding: const EdgeInsets.all(0),
//                     child: Center(
//                       child: SizedBox(
//                         height: 48.h,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset('assets/image/Icon/add.svg'),
//                             Text(
//                               'Add New Plan',
//                               style: TextStyles.textStyleRegular.copyWith(
//                                   fontSize: 14.sp, color: AppColors.n900Black),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )),
//           )
