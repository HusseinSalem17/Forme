import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/image_selection_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramBody extends StatelessWidget {
  final XFile? imageFile;
  final void Function(XFile?) onImageSelected;
  const AddProgramBody({
    super.key,
    required this.imageFile,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.n20FillBodyInSmallCardColor,
          borderRadius: BorderRadius.circular(14.dg)),
      child: Column(children: [
        Text(
          'Add Program cover or preview',
          style: TextStyles.textStyleBold.copyWith(
            fontSize: 14.sp,
          ),
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
              onImageSelected: onImageSelected,
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
              margin: EdgeInsets.all(10.h),
              child: SvgPicture.asset('assets/image/Icon/addImage.svg')),
        ),
        
      ]),
    );
  }
}
