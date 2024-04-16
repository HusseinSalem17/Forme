import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:open_file/open_file.dart';

class DocumentsPicker extends StatefulWidget {
  const DocumentsPicker({super.key});

  @override
  State<DocumentsPicker> createState() => _DocumentsPickerState();
}

class _DocumentsPickerState extends State<DocumentsPicker> {
  FilePickerResult? result;
  List<PlatformFile>? files = [];
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        TextButton(
          onPressed: () {
            pickDocuments();
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(6.r),
            color: AppColors.n40Gray,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 59.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "upload ",
                      style: TextStyles.textStyleRegular.copyWith(
                        color: AppColors.n900Black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/image/Icon/upload-cloud.svg',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Column(
          children: files?.map((file) => buildListFile(file)).toList() ?? [],
        ),
      ],
    ));
  }

  bool isPickerOpen = false;
  bool isSelected = false;
  void pickDocuments() async {
    if (isPickerOpen) {
      return;
    }
    isPickerOpen = true;
    FilePickerResult? newResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'jpg', 'jpeg', 'png'],
      allowMultiple: true,
    );
    isPickerOpen = false;
    if (newResult != null) {
      setState(() {
        if (files != null) {
          files!.addAll(newResult.files);
        } else {
          files = newResult.files;
        }
      });
    }
    if (result == null) {
      return;
    }
    setState(() {
      files = result!.files;
    });
  }

  Widget buildListFile(PlatformFile file) {
    Widget icon;
    Color containerColor;
    Color iconColor;

    switch (file.extension) {
      case 'pdf':
        icon = const Icon(FontAwesomeIcons.filePdf);
        containerColor = AppColors.p50PrimaryColor;
        iconColor = AppColors.primaryColor;
        break;
      case 'doc' || 'docx':
        icon = const Icon(FontAwesomeIcons.fileWord);
        containerColor = AppColors.p50PrimaryColor;
        iconColor = AppColors.primaryColor;
        break;
      case 'xls' || 'xlsx':
        icon = const Icon(FontAwesomeIcons.fileExcel);
        containerColor = const Color(0xFFF5FFF7);
        iconColor = const Color(0xFF009011);
        break;
      case 'txt':
        icon = const Icon(FontAwesomeIcons.fileText);
        containerColor = const Color(0xFFD2F9D0);
        iconColor = const Color(0xFF015B0B);
        break;
      case 'ppt' || 'pptx':
        icon = const Icon(FontAwesomeIcons.filePowerpoint);
        containerColor = const Color(0xFFFFDED1);
        iconColor = const Color(0xffff4500);
        break;
      case 'jpg' || 'jpeg' || 'png':
        icon = const Icon(FontAwesomeIcons.fileImage);
        containerColor = const Color(0xFFFFE7E7);
        iconColor = const Color(0xFFFF0303);
        break;
      default:
        icon = const Icon(FontAwesomeIcons.file);
        containerColor = const Color(0xFFD9D9D9);
        iconColor = AppColors.n900Black;
        break;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              files!.remove(file);
            });
          },
          child: const Icon(
            Icons.delete_outline,
            color: AppColors.d300Danger,
          ),
        ),
        title: Text(
          file.name,
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
            data: IconThemeData(
              color: iconColor,
            ),
            child: icon,
          ),
        ),
        onTap: () => viewFile(file),
      ),
    );
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
