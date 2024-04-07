import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionBottomSheet extends StatelessWidget {
  final void Function(XFile?) onImageSelected;

  const ImageSelectionBottomSheet({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0.w,
        vertical: 16.0.h,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyles.textStyleBold.copyWith(
              color: AppColors.n900Black,
              fontSize: 16.sp
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: AppColors.primaryColor,
                  child: IconButton(
                    onPressed: () {
                      takePhoto(context, ImageSource.camera, onImageSelected);
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    color: AppColors.n40BorderColor,
                    splashColor: const Color(0xff003E9C),
                    padding: const EdgeInsets.all(10.0),
                    iconSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: AppColors.primaryColor,
                  child: IconButton(
                    onPressed: () {
                      takePhoto(context, ImageSource.gallery, onImageSelected);
                    },
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    color: AppColors.n40BorderColor,
                    splashColor: const Color(0xff003E9C),
                    padding: const EdgeInsets.all(10.0),
                    iconSize: 30.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(
    BuildContext context,
    ImageSource source,
    void Function(XFile?) onImageSelected,
  ) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
      maxHeight: 150,
    );

    Navigator.pop(context);
    onImageSelected(pickedFile);
  }
}
