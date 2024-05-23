import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;

class DocumentsPicker extends StatefulWidget {
  const DocumentsPicker({super.key});

  @override
  State<DocumentsPicker> createState() => _DocumentsPickerState();
}

class _DocumentsPickerState extends State<DocumentsPicker> {
  bool isPickerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildUploadButton(),
          _buildFileList(),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return TextButton(
      onPressed: pickFiles,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(6.r),
        color: AppColors.n40Gray,
        child: Center(
          child: SizedBox(
            height: 59.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Upload ",
                  style: TextStyles.textStyleRegular.copyWith(
                    color: AppColors.n900Black,
                    fontSize: 14.sp,
                  ),
                ),
                SvgPicture.asset('assets/image/Icon/upload-cloud.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      children: List<Widget>.generate(
        context.read<TrainerPreferenceCubit>().files.length,
        (int index) {
          return _buildFileTile(
              context.read<TrainerPreferenceCubit>().files[index]);
        },
      ),
    );
  }

  Future pickFiles() async {
    List<File> files = [];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
        'txt',
        'jpg',
        'jpeg',
        'png'
      ],
      allowMultiple: true,
    );

    if (result != null && mounted) {
      setState(() {
        files.addAll(result.paths.map((path) => File(path!)).toList());
      });
      context.read<TrainerPreferenceCubit>().files.addAll(files);
    }
  }

  Widget _buildFileTile(File file) {
    Widget icon = _getFileIcon(file);
    Color containerColor = _getContainerColor(file);
    Color iconColor = _getIconColor(file);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: GestureDetector(
          onTap: () => _removeFile(file),
          child: const Icon(
            Icons.delete_outline,
            color: AppColors.d300Danger,
          ),
        ),
        title: Text(
          file.path.split('/').last,
          style: TextStyles.textStyleRegular.copyWith(
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ),
        trailing: Container(
          height: 56,
          width: 67,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.r),
            color: containerColor,
          ),
          child: IconTheme(
            data: IconThemeData(color: iconColor),
            child: icon,
          ),
        ),
        onTap: () => viewFile(file),
      ),
    );
  }

  void _removeFile(File file) {
    setState(() {
      context.read<TrainerPreferenceCubit>().files.remove(file);
    });
  }

  void viewFile(File file) {
    OpenFile.open(file.path);
  }

  Widget _getFileIcon(File file) {
    switch (p.extension(file.path)) {
      case '.docx' || '.doc' || '.pdf':
        return const Icon(FontAwesomeIcons.fileWord);

      case '.xlsx' || '.xls':
        return const Icon(FontAwesomeIcons.fileExcel);
      case 'txt':
        return const Icon(FontAwesomeIcons.fileText);

      case '.pptx' || '.ppt':
        return const Icon(FontAwesomeIcons.filePowerpoint);

      case '.png' || '.jpg' || '.jpeg':
        return const Icon(FontAwesomeIcons.fileImage);
      default:
        return const Icon(FontAwesomeIcons.file);
    }
  }

  Color _getContainerColor(File file) {
    switch (p.extension(file.path)) {
      case '.docx' || '.doc' || '.pdf':
        return AppColors.p50PrimaryColor;

      case '.xlsx' || '.xls':
        return const Color(0xFFF5FFF7);
      case '.txt':
        return const Color(0xFFD2F9D0);

      case '.pptx' || '.ppt':
        return const Color(0xFFFFDED1);

      case '.png' || '.jpg' || '.jpeg':
        return const Color(0xFFFFE7E7);
      default:
        return const Color(0xFFD9D9D9);
    }
  }

  Color _getIconColor(File file) {
    switch (p.extension(file.path)) {
      case '.docx' || '.doc' || '.pdf':
        return AppColors.primaryColor;
      case '.xlsx' || '.xls':
        return const Color(0xFF009011);
      case '.txt':
        return const Color(0xFF015B0B);
      case '.pptx' || '.ppt':
        return const Color(0xFFFF4500);
      case '.png' || '.jpg' || '.jpeg':
        return const Color(0xFFFF0303);
      default:
        return AppColors.n900Black;
    }
  }
}
