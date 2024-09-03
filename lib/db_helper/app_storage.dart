import 'dart:convert';

import 'package:auth/models/login/login_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final FlutterSecureStorage flutterSecureStorage =
      const FlutterSecureStorage();

  String token = "TOKEN";
  String user = "USER";

  void putToken(value) {
    flutterSecureStorage.write(key: token, value: value);
  }

  Future<String?> readToken() async {
    String? value = await flutterSecureStorage.read(key: token);
    return value;
  }

  void putKey(key, value) {
    flutterSecureStorage.write(key: key, value: value);
  }

  Future<String> readKey(key) async {
    String? result = await flutterSecureStorage.read(key: key);
    return result ?? "";
  }

  Future<void> removeKey(key) async {
    await flutterSecureStorage.delete(key: key);
  }

  void putUser(UserResponse userResponse) {
    putToken(userResponse.data?.jwtToken);
    flutterSecureStorage.write(key: user, value: jsonEncode(userResponse));
  }

  Future<UserResponse> getUser() async {
    String? result = await flutterSecureStorage.read(key: user);
    if (result != null && result.isNotEmpty) {
      Map<String, dynamic> userMap = jsonDecode(result);
      UserResponse userResponse = UserResponse.fromJson(userMap);
      return userResponse;
    }
    return UserResponse();
  }
}
