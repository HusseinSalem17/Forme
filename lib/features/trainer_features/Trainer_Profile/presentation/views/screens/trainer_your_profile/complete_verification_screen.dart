import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../trainer_preference/presentation/views/widgets/documents_picker.dart';
import '../../../../../trainer_preference/presentation/views/widgets/id_image_picker.dart';

class CompleteVerificationScreen extends StatefulWidget {
  const CompleteVerificationScreen({super.key});

  @override
  State<CompleteVerificationScreen> createState() => _CompleteVerificationScreenState();
}

class _CompleteVerificationScreenState extends State<CompleteVerificationScreen> {
  XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context, 'Complete Verification'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('(optional)', style: TextStyles.textStyleMedium.copyWith(color: AppColors.n100Gray, fontSize: 11.sp)),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              IdImagePicker(
                                imageFile: imageFile,
                                onImageSelected: (file) {
                                  setState(() {
                                    imageFile = file;
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
                                'The uploaded ID will not be display in \nyour profile',
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
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: const DocumentsPicker(),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 6.h,
                )
              ],
            ),
          ),
        ));
  }
}
