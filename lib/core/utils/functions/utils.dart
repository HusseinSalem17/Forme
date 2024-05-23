import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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
}
