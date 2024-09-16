import 'dart:io';

import 'package:dio/dio.dart';

class AppUtils {
  static Future<Map<String, dynamic>> addImage(
      Map<String, dynamic> map, String name, File image) async {
    String fileName = image.path.split('/').last;
    map[name] = await MultipartFile.fromFile(
      image.path,
      filename: fileName,
    );
    return map;
  }
}
