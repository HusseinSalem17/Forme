import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/import_media.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/select_gender_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/target_age_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/widgets/gender_chech_button.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/upload_file.dart';

class AddWorkoutBody extends StatefulWidget {
  const AddWorkoutBody(
      {super.key,
      required this.sportFieldNotifier,
      required this.levelNotifier,
      required this.titleController,
      required this.priceController,
      this.offerPriceController,
      this.maxClientsController,
      this.minAgeController,
      this.maxAgeController,
      required this.isOffer,
      this.descriptionController,
      this.vedios,
      required this.genderNotifier});
  final TextEditingController titleController;
  final TextEditingController priceController;
  final ValueChanged<bool> isOffer;
  final TextEditingController? offerPriceController;
  final TextEditingController? minAgeController;
  final TextEditingController? maxAgeController;
  final TextEditingController? maxClientsController;
  final ValueNotifier<String?> sportFieldNotifier;
  final ValueNotifier<String?> levelNotifier;
  final TextEditingController? descriptionController;
  final void Function(String) genderNotifier;
  final List<VideoDetails>? vedios;
  @override
  State<AddWorkoutBody> createState() => _AddWorkoutBodyState();
}

class _AddWorkoutBodyState extends State<AddWorkoutBody> {
  bool _isChecked = false;
  String? gender;
  List<VideoDetails>? vedios;
  List<int> files = List<int>.generate(1, (int index) => index);
  final List<String> level = [
    'I am just staring',
    'I know the basics',
    'I know a lot',
    'I am a samurai'
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
          title: 'Workout Title',
          titleColor: AppColors.n400,
          hintText: 'Type here',
          hintStyle: TextStyles.hintStyle,
          controller: widget.titleController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Workout title is required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                title: 'Price',
                titleColor: AppColors.n400,
                hintText: '0.0',
                keyboardType: TextInputType.number,
                hintStyle: TextStyles.hintStyle,
                controller: widget.priceController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Workout price is required';
                  }
                  return null;
                },
              ),
            ),
            Column(
              children: [
                Text(
                  "Offer",
                  style: TextStyles.textStyleBold.copyWith(
                    color: AppColors.n400,
                    fontSize: 14.sp,
                  ),
                ),
                Checkbox(
                  value: _isChecked,
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                      widget.isOffer(value);
                    });
                  },
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Visibility(
            visible: _isChecked,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: 'Offer Price ',
                      subTitle: '(EGP)',
                      titleColor: AppColors.n400,
                      hintText: '0.0',
                      keyboardType: TextInputType.number,
                      hintStyle: TextStyles.hintStyle,
                      controller: widget.offerPriceController,
                      validator: _isChecked
                          ? (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'offer price is required';
                              }
                              return null;
                            }
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: 16.h,
                  ),
                  Expanded(
                    child: CustomTextField(
                      title: 'Max.Clients',
                      optional: true,
                      titleColor: AppColors.n400,
                      hintText: '0.0',
                      keyboardType: TextInputType.number,
                      controller: widget.maxClientsController,
                      hintStyle: TextStyles.hintStyle,
                    ),
                  ),
                ],
              ),
            )),
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
        Text(
          'Upload Files (you can add multiple videos or files)',
          style: TextStyles.textStyleBold.copyWith(
            fontSize: 14.sp,
            color: AppColors.n400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            onPressed: () async {
              final result = await Navigator.of(context)
                  .push(PageSlideTransition(const UploadFile()));
              vedios!.add(result);
            },
            child: Container(
              color: AppColors.n10Color,
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
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Add Video or File',
                          style: TextStyles.textStyleRegular.copyWith(
                              fontSize: 14.sp, color: AppColors.n900Black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Column(
        //   children: List<Widget>.generate(files.length, (int index) {
        //     return WorkOutFileCard(
        //       onTap: () {
        //         setState(() {
        //           files.removeAt(index);
        //         });
        //       },
        //     );
        //   }),
        // ),
      ],
    );
  }
}
