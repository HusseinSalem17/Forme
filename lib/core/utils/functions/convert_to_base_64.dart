import 'dart:convert';

import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<String> convertXFileToBase64(XFile file) async {
  Uint8List fileBytes = await file.readAsBytes();

  String base64String = base64Encode(fileBytes);

  return base64String;
}
