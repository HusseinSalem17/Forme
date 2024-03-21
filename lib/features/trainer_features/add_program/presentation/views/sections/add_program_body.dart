import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/app_fields/program_capacity_field.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/select_gender_section.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/target_age_section.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/image_selection_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramBody extends StatefulWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;
  const AddProgramBody({
    super.key,
    required this.imageFile,
    required this.onImageSelected,
  });

  @override
  State<AddProgramBody> createState() => _AddProgramBodyState();
}

class _AddProgramBodyState extends State<AddProgramBody> {
  String? programType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.n20FillBodyInSmallCardColor,
          borderRadius: BorderRadius.circular(14.dg)),
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
                    border:
                        Border.all(color: AppColors.n40BorderColor, width: 1.h),
                    borderRadius: BorderRadius.circular(8.dg)),
                padding: EdgeInsets.all(38.h),
                child: SvgPicture.asset('assets/image/Icon/addImage.svg')),
          ),
          SizedBox(
            height: 16.h,
          ),
          const CustomTextField(
            title: 'Program Title',
            titleColor: AppColors.n400,
            hintText: 'Type here',
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
            color: AppColors.n40BorderColor,
          ),
          const TargetAgeSection(),
          const Divider(
            thickness: 1,
            color: AppColors.n40BorderColor,
          ),

          Row(
            children: [
              SvgPicture.asset('assets/image/Icon/plans.svg'),
              SizedBox(
                width: 21.w,
              ),
              Text(
                'Payment Plans',
                style: TextStyles.textStyleBold.copyWith(
                    fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              )
            ],
          ),
          const PaymentPlanItem()
        ]),
      ),
    );
  }
}

class PaymentPlanItem extends StatefulWidget {
  const PaymentPlanItem({
    super.key,
  });

  @override
  State<PaymentPlanItem> createState() => _PaymentPlanItemState();
}

class _PaymentPlanItemState extends State<PaymentPlanItem> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _firstController = TextEditingController();
    _secondController = TextEditingController();

    _firstFocusNode.addListener(() {
      if (!_firstFocusNode.hasFocus && _firstController.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(_secondFocusNode);
      }
    });
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customNumberField(
                _firstFocusNode,
                _firstController,
                context,
                'Duration (weeks)',
                (MediaQuery.sizeOf(context).width * 2 / 3) - 48,
              ),
              customNumberField(_secondFocusNode, _secondController, context,
                  'Price (EGP)', (MediaQuery.sizeOf(context).width / 3) - 24),
            ],
          ),
        ),
      ],
    );
  }

  Container customNumberField(
      FocusNode focusNode,
      TextEditingController controller,
      BuildContext context,
      String title,
      double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.n40BorderColor,
          ),
          borderRadius: BorderRadius.circular(4.dg),
          color: AppColors.background),
      margin: EdgeInsets.only(bottom: 4.h),
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.n200BodyContentColor,
                  height: 1)),
          TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp, color: AppColors.n200BodyContentColor),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: textFieldBorder(
                color: AppColors.r200ErrorColor,
                width: 2.0,
              ),
            ),
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ],
      ),
    );
  }
}

  

