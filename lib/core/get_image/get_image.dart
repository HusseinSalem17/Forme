import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhotoPicker {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
  Future<MultipartFile?> prepareImageForUpload(File? image) async {
    if (image == null) return null;
    return await MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
  }
}
