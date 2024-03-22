import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/image_selection_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class AddWorkoutBody extends StatefulWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;
  const AddWorkoutBody({
    super.key,
    required this.imageFile,
    required this.onImageSelected,
  });

  @override
  State<AddWorkoutBody> createState() => _AddWorkoutBodyState();
}

class _AddWorkoutBodyState extends State<AddWorkoutBody> {
  bool _isChecked = false;
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
            title: 'Workout Title',
            titleColor: AppColors.n400,
            hintText: 'Type here',
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              const Expanded(
                child: CustomTextField(
                  title: 'Price',
                  titleColor: AppColors.n400,
                  hintText: '0.0',
                  keyboardType: TextInputType.number,
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
                    activeColor: AppColors.p300PrimaryColor,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
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
                    const Expanded(
                      child: CustomTextField(
                        title: 'Offer Price ',
                        subTitle: '(EGP)',
                        titleColor: AppColors.n400,
                        hintText: '0.0',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    const Expanded(
                      child: CustomTextField(
                        title: 'Max.Clients',
                        optional: true,
                        titleColor: AppColors.n400,
                        hintText: '0.0',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              )),
          const TextArea(title: 'Description'),
          SizedBox(
            height: 16.h,
          ),
        ]),
      ),
    );
  }
}
