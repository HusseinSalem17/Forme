// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forme_app/core/utils/functions/utils.dart';
import 'package:video_player/video_player.dart';

import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';
import 'package:forme_app/core/widgets/text_area.dart';

class UploadFile extends StatefulWidget {
  static const routeName = '/upload-file-screen';

  const UploadFile({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  VideoPlayerController? _controller;
  String? _videoPath;
  File? file;
  String _videoDuration = '';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _videoListener() {
    if (_controller != null &&
        _controller!.value.position == _controller!.value.duration) {
      _controller!.seekTo(Duration.zero);
    }
  }

  Future<void> _uploadVideo() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null) {
      file = File(result.files.single.path!);
      var videoDuration = await Utils().getVideoDuration(file!);
      setState(() {
        _videoPath = file!.path;
        _controller = VideoPlayerController.file(file!)
          ..initialize().then((_) {
            setState(() {
              _videoDuration = videoDuration; // Set formatted video duration
            }); // Ensure the first frame is shown
            _controller!.play();
          });
        _controller!.addListener(_videoListener);
      });
    } else {
      debugPrint('No file selected');
    }
  }

  Widget _buildVideoPlayer() {
    if (_controller != null && _controller!.value.isInitialized) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
      );
    } else {
      return SvgPicture.asset('assets/image/Icon/upload.svg');
    }
  }

  void _handleUpload() {
    if (file != null) {
      // Prepare data to send back to previous screen
      VideoDetails videoDetails = VideoDetails(
        file: file!,
        videoPath: _videoPath!,
        title: _titleController.text,
        description: _descriptionController.text,
        videoDuration: _videoDuration, // Pass formatted video duration
      );

      Navigator.pop(context, videoDetails);
    }
  }

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
              'Upload File',
              style: TextStyles.textStyleBold
                  .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
            ),
            const Spacer(),
            const SizedBox(width: 17),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.n20Gray,
                  borderRadius: BorderRadius.circular(14.dg),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    children: [
                      CustomBuildForm(
                        title: 'Upload File or Video',
                        titleColor: AppColors.n400,
                        child: GestureDetector(
                          onTap: _uploadVideo,
                          child: Container(
                            color: AppColors.n10Color,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 2,
                              radius: Radius.circular(8.r),
                              color: AppColors.n40Gray,
                              padding: const EdgeInsets.all(0),
                              child: Center(
                                child: SizedBox(
                                  height: _controller != null &&
                                          _controller!.value.isInitialized
                                      ? null
                                      : MediaQuery.of(context).size.height / 5,
                                  child: _buildVideoPlayer(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        title: 'Title',
                        titleColor: AppColors.n400,
                        hintText: 'Type here',
                        hintStyle: TextStyles.hintStyle,
                        controller: _titleController,
                      ),
                      SizedBox(height: 16.h),
                      const TextArea(title: 'Description'),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Upload Video',
              onTap: _handleUpload,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoDetails {
  final File file;
  final String videoPath;
  final String title;
  final String description;
  final String videoDuration; // New field to store formatted video duration

  VideoDetails({
    required this.file,
    required this.videoPath,
    required this.title,
    required this.description,
    required this.videoDuration, // Initialize in constructor
  });
}
