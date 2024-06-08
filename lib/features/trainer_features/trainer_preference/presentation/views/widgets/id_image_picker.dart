import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/image_picker/image_selection_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class IdImagePicker extends StatelessWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;

  const IdImagePicker({
    Key? key,
    required this.imageFile,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          builder: (context) {
            return ImageSelectionBottomSheet(
              onImageSelected: onImageSelected,
            );
          },
        );
      },
      child: Container(
        width: 80.w,
        height: 56.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6.r),
          image: imageFile == null
              ? null
              : DecorationImage(
                  image: FileImage(
                    File(imageFile!.path),
                  ),
                  fit: BoxFit.cover,
                ),
        ),
        child: imageFile == null ? defaultImage() : null,
      ),
    );
  }

  Widget defaultImage() {
    return Container(
      width: 80.w,
      height: 56.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.background,
        border: Border.all(
          color: AppColors.n40Gray,
          width: 1.0,
        ),
      ),
      child: SvgPicture.asset(
        "assets/image/Icon/id.svg",
        height: 30.h,
        width: 30.w,
        fit: BoxFit.none,
      ),
    );
  }
}
