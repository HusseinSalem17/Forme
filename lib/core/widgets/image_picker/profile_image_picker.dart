import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'image_selection_bottom_sheet.dart';

class ProfileImagePicker extends StatelessWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;
  final bool enabled;
  const ProfileImagePicker(
      {Key? key,
      required this.imageFile,
      required this.onImageSelected,
      this.enabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundImage: imageFile == null
                ? null
                : FileImage(
                    File(imageFile!.path), //picked image
                  ),
            child: imageFile == null ? defaultImage() : null,
          ),
          Visibility(
            visible: enabled,
            child: Positioned(
              bottom: 8.0,
              right: 8.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (builder) => ImageSelectionBottomSheet(
                      onImageSelected: onImageSelected,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  "assets/image/Icon/edit_pen.svg",
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultImage() {
    return CircleAvatar(
      radius: 60.r,
      backgroundColor: AppColors.n50BackgroundColor,
      child: SvgPicture.asset(
        "assets/image/Icon/user_avatar.svg",
        height: 70.h,
        width: 70.w,
      ),
    );
  }
}
