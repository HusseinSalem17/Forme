import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/app_fields/program_capacity_field.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/payment_plan_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/select_gender_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/target_age_section.dart';
import 'package:forme_app/core/widgets/image_picker/image_selection_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramBody extends StatefulWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;
  final ValueNotifier<String?> typeNotifier;
  final ValueNotifier<String?> sportFieldNotifier;

  const AddProgramBody({
    super.key,
    required this.imageFile,
    required this.onImageSelected,
    required this.typeNotifier,
    required this.sportFieldNotifier,
  });

  @override
  State<AddProgramBody> createState() => _AddProgramBodyState();
}

class _AddProgramBodyState extends State<AddProgramBody> {
  String? programType;
  List<int> paymentItems = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.n20Gray, borderRadius: BorderRadius.circular(14.dg)),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(children: [
          Text(
            'Add Program cover or preview',
            style: TextStyles.textStyleBold
                .copyWith(fontSize: 14.sp, color: AppColors.n400),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              builder: (builder) => ImageSelectionBottomSheet(
                onImageSelected: widget.onImageSelected,
              ),
            ),
            child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.n40Gray, width: 1.h),
                    borderRadius: BorderRadius.circular(8.dg)),
                padding: EdgeInsets.all(38.h),
                child: SvgPicture.asset('assets/image/Icon/addImage.svg')),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            title: 'Program Title',
            titleColor: AppColors.n400,
            hintText: 'Type here', hintStyle: TextStyles.headerStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          const ProgramCapacityField(), //TextStyles.hintStyle
          CustomDropList(
            title: "Type",
            hint: const Text('Select Your Program Type'),
            items: ['Online', 'Offline']
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'field is required.';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                programType = value!;
              });
            },
            onSaved: (value) {},
            selectedValueNotifier: widget.typeNotifier,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomDropList(
            title: "Sport Field",
            hint: const Text('Select Your Sport Field'),
            items: ['Fitness', 'baseball', 'rugby']
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'field is required.';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                programType = value!;
              });
            },
            onSaved: (value) {},
            selectedValueNotifier: widget.sportFieldNotifier,
          ),
          SizedBox(
            height: 16.h,
          ),
          const TextArea(title: 'Description'),
          SizedBox(
            height: 16.h,
          ),
          selectGenderSection(),
          const Divider(
            thickness: 1,
            color: AppColors.n40Gray,
          ),
          const TargetAgeSection(),
          const Divider(
            thickness: 1,
            color: AppColors.n40Gray,
          ),
          Row(
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
          Column(
            children: List<Widget>.generate(paymentItems.length, (int index) {
              return PaymentPlanItem(
                onTap: () {
                  setState(() {
                    paymentItems.removeAt(index);
                  });
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  paymentItems.add(paymentItems.length + 1);
                });
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.n200Gray),
                    color: AppColors.n20FillBodyInBigCardColor,
                    borderRadius: BorderRadius.circular(16.dg)),
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
          )
        ]),
      ),
    );
  }
}
