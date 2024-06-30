import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/video_player_widget.dart';
import 'package:image_picker/image_picker.dart';

class ImportMedia extends StatefulWidget {
  const ImportMedia({super.key, required this.title, this.onFilePicked});
  final String title;
  final void Function(XFile?)? onFilePicked;
  
  @override
  State<ImportMedia> createState() => _ImportMediaState();
}

class _ImportMediaState extends State<ImportMedia> {
  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      _filePath = result.files.single.path;
      XFile xFile = XFile(_filePath!);
      if (widget.onFilePicked != null) {
        widget.onFilePicked!(xFile);
      }
    } else {
      if (widget.onFilePicked != null) {
        widget.onFilePicked!(null);
      }
    }

    setState(() {});
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
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.n40Gray, width: 1.h),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _filePath != null
                ? _filePath!.endsWith('.mp4')
                    ? VideoPlayerWidget(filePath: _filePath!)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(_filePath!),
                          fit: BoxFit.cover,
                        ),
                      )
                : Padding(
                    padding: EdgeInsets.all(50.h),
                    child: SvgPicture.asset('assets/image/Icon/addImage.svg'),
                  ),
          ),
        ),
      ],
    );
  }
}