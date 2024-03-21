import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/image_selection_bottom_sheet.dart';

class EditTransformation extends StatefulWidget {
  const EditTransformation({super.key});

  get onImageSelected => null;

  @override
  State<EditTransformation> createState() => _EditTransformationState();
}

class _EditTransformationState extends State<EditTransformation> {
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CustomAppBarArrowButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              Text(
                "Edit Transformations",
                style: TextStyles.textStyleBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.n900PrimaryTextColor,
                ),
              ),
              const Spacer(),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.dg),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.n50dropShadowColor.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: SvgPicture.asset(
                    isEditing
                        ? 'assets/image/Icon/ok.svg'
                        : "assets/image/Icon/tabler_pencil.svg",
                    height: 30.w,
                    width: 30.w,
                  ),
                ),
                onPressed: () {
                  if (isEditing) Navigator.pop(context);
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.n20FillBodyInSmallCardColor,
                  borderRadius: BorderRadius.circular(14.dg)),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Upload Image or Video',
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
                            border: Border.all(
                                color: AppColors.n40BorderColor, width: 1.h),
                            borderRadius: BorderRadius.circular(8.dg)),
                        padding: EdgeInsets.all(38.h),
                        child:
                            SvgPicture.asset('assets/image/Icon/addImage.svg')),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextArea(enabled: isEditing, title: 'Description'),
                  SizedBox(
                    height: 16.h,
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
