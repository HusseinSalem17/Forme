import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future getImageName(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

String imageToBase64(XFile image) {
  final imageBytes = File(image.path)
      .readAsBytesSync(); // process to asynchronization to read file data

  return base64Encode(imageBytes);
}
