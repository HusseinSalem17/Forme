import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/documents_picker.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/id_image_picker.dart';
import 'package:image_picker/image_picker.dart';

class SecondPreferenceTrainer extends StatefulWidget {
  const SecondPreferenceTrainer({super.key});

  @override
  State<SecondPreferenceTrainer> createState() =>
      _SecondPreferenceTrainerState();
}

class _SecondPreferenceTrainerState extends State<SecondPreferenceTrainer> {
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        IdImagePicker(
                          imageFile: _imageFile,
                          onImageSelected: (file) {
                            setState(() {
                              _imageFile = file;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'please upload your ID for verification',
                          textAlign: TextAlign.start,
                          style: TextStyles.textStyleSemiBold.copyWith(
                            color: AppColors.n900Black,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          'The uploaded ID will ot be display in \nyour profile', // Display selected items
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.n200Gray,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Upload Documents For Verification ',
                        style: TextStyles.textStyleSemiBold.copyWith(
                          color: AppColors.n900Black,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: '(like Experience Certificate or course)',
                        style: TextStyles.textStyleRegular.copyWith(
                          color: AppColors.n100Gray,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                DocumentsPicker(),
                Container(
                  height: MediaQuery.sizeOf(context).height / 6.h,
                )
              ],
            ),
          ),
        ));
  }
}
