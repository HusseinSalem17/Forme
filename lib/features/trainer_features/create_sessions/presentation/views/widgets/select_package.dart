import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/custom_text_form_field.dart';

class SelectPackage extends StatefulWidget {
  final String text1, text2, text3, text4, text5;
  final bool isInput, isLanguages;
  const SelectPackage({
    super.key,
    this.isInput = true,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    this.text5 = '',
    this.isLanguages = false,
  });

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  bool isChat = false;
  bool isCall = false;
  bool isVideo = false;
  bool isInPerson = false;
  bool isText5 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChat,
                  onChanged: (val) {
                    setState(() {
                      isChat = val!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
                Text(widget.text1, style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black)),
              ],
            ),
            widget.isInput
                ? TextFieldWithCustomLabel(
                    isEnabled: isChat,
                  )
                : Container(),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isCall,
                  onChanged: (val) {
                    setState(() {
                      isCall = val!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
                Text(widget.text2, style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black)),
              ],
            ),
            widget.isInput ? TextFieldWithCustomLabel(isEnabled: isCall) : Container(),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isVideo,
                  onChanged: (val) {
                    setState(() {
                      isVideo = val!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
                Text(widget.text3, style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black)),
              ],
            ),
            widget.isInput
                ? TextFieldWithCustomLabel(
                    isEnabled: isVideo,
                  )
                : Container(),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isInPerson,
                  onChanged: (val) {
                    setState(() {
                      isInPerson = val!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
                Text(widget.text4, style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black)),
              ],
            ),
            widget.isInput
                ? TextFieldWithCustomLabel(
                    isEnabled: isInPerson,
                  )
                : Container(),
          ],
        ),
        SizedBox(height: 8.h),
        widget.isLanguages
            ? Row(
                children: [
                  Checkbox(
                    value: isText5,
                    onChanged: (val) {
                      setState(() {
                        isText5 = val!;
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  Text(widget.text5, style: TextStyles.textStyleRegular.copyWith(color: AppColors.n900Black)),
                ],
              )
            : Container(),
      ],
    );
  }
}
