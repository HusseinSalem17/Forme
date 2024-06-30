import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class Utils {
  Future uploadImageToAPI(XFile image) async {
    return MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
  }

  Future<String> convertXFileToBase64(XFile file) async {
    // Read the file as bytes
    Uint8List fileBytes = await file.readAsBytes();

    // Convert bytes to base64 string
    String base64String = base64Encode(fileBytes);

    return base64String;
  }

  Future<List<MultipartFile>> convertToMultiperFile(List<File> files) async {
    // Initialize an empty list to store the MultipartFile objects
    List<MultipartFile> dioFiles = [];

    // Iterate over each file in the list of files
    for (File file in files) {
      // Extract the file name from the file path
      String fileName = file.path.split('/').last;

      // Create a MultipartFile from the file and add it to the list
      // The MultipartFile.fromFile method reads the file from the given path and prepares it for upload
      dioFiles.add(await MultipartFile.fromFile(file.path, filename: fileName));
    }

    // Return the list of MultipartFile objects
    return dioFiles;
  }

  DateTime convertToDateTime(String dateString) {
    final parts = dateString.split('-');
    if (parts.length != 3) {
      throw const FormatException("Invalid date format");
    }
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    return DateTime(year, month, day);
  }

  String convertToString(DateTime dateTime) {
    final day = dateTime.day.toString();
    final month = dateTime.month.toString();
    final year = dateTime.year.toString();

    return '$day-$month-$year';
  }

  //convert form this date string from '10-09-2002' to '2002-09-10'
  String convertDateString(String dateString) {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime dateTime = inputFormat.parse(dateString);
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }
  Future<String> getVideoDuration(File file) async {
    final videoPlayerController = VideoPlayerController.file(file);
    await videoPlayerController.initialize();
    final duration = videoPlayerController.value.duration;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    final formattedDuration =
        '$minutes:${seconds.toString().padLeft(2, '0')} mins';
    videoPlayerController.dispose();
    return formattedDuration;
  }
}
