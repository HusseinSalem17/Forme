import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/video_player_widget.dart';

class ImportMedia extends StatefulWidget {
  const ImportMedia({super.key, required this.title});
  final String title;
  @override
  State<ImportMedia> createState() => _ImportMediaState();
}

class _ImportMediaState extends State<ImportMedia> {
  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyles.textStyleBold
              .copyWith(fontSize: 14.sp, color: AppColors.n400, height: 3),
        ),
        GestureDetector(
            onTap: _pickFile,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 5,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.n40Gray, width: 1.h),
                  borderRadius: BorderRadius.circular(8.dg)),
              child: _filePath != null
                  ? _filePath!.endsWith('.mp4')
                      ? VideoPlayerWidget(filePath: _filePath!)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.dg),
                          child: Image.file(
                            File(_filePath!),
                            fit: BoxFit.cover,
                          ),
                        )
                  : Padding(
                      padding: EdgeInsets.all(50.h),
                      child: SvgPicture.asset('assets/image/Icon/addImage.svg'),
                    ),
            )),
      ],
    );
  }
}
