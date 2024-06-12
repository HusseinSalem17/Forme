import 'dart:convert';

import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<String> convertXFileToBase64(XFile file) async {
  // Read the file as bytes
  Uint8List fileBytes = await file.readAsBytes();

  // Convert bytes to base64 string
  String base64String = base64Encode(fileBytes);

  return base64String;
}
