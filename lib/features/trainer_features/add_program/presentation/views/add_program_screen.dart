import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/add_program_body.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramScreen extends StatefulWidget {
  static const routeName = '/add-program-screen';

  const AddProgramScreen({super.key});

  @override
  State<AddProgramScreen> createState() => _AddProgramScreenState();
}

class _AddProgramScreenState extends State<AddProgramScreen> {
  XFile? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Add Program',
              style: TextStyles.textStyleBold.copyWith(
                  fontSize: 18.sp, color: AppColors.n900Black),
            ),
            const Spacer(),
            GestureDetector(
              child: SvgPicture.asset('assets/image/Icon/success.svg'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: Center(
            child: SingleChildScrollView(
              child: AddProgramBody(
                        imageFile: _imageFile,
                        onImageSelected: (file) {
              setState(() {
                _imageFile = file;
              });
                        },
                      ),
            )),
      ),
    );
  }
}
