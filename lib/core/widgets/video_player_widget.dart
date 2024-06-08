import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String filePath;

  const VideoPlayerWidget({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        child: filePath.isNotEmpty
            ? FutureBuilder(
                future: _initializeVideoPlayer(filePath),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading video'));
                  }
                  else {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(8.dg),
                        child: VideoPlayer(
                            snapshot.data as VideoPlayerController));
                  }
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<VideoPlayerController> _initializeVideoPlayer(String filePath) async {
    final videoController = VideoPlayerController.file(File(filePath));
    await videoController.initialize();
    return videoController;
  }
}
