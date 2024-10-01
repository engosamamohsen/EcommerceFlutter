import 'dart:convert';

import 'package:Emend/models/login/login_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorageShared {
  final flutterSecureStorage = new FlutterSecureStorage();

  String _token = "TOKEN";
  String _user = "USER";

  void putToken(value) async {
    print("token for saving $value");
    await flutterSecureStorage.write(key: _token, value: value);
    String? token = await flutterSecureStorage.read(key: _token);
    print("token for saving HERERERER $value");
  }

  Future<String?> readToken() async {
    String? value = await flutterSecureStorage.read(key: _token);
    return value;
  }

  Future<void> removeToken() async {
    await flutterSecureStorage.delete(key: _token);
  }

  void putKey(key, value) async {
    await flutterSecureStorage.write(key: key, value: value);
  }

  Future<String> readKey(key) async {
    String? result = await flutterSecureStorage.read(key: key);
    return result ?? "";
  }

  Future<void> removeKey(key) async {
    await flutterSecureStorage.delete(key: key);
  }

  void putUser(UserResponse userResponse) async {
    putToken(userResponse.data?.jwtToken);
    await flutterSecureStorage.write(
        key: _user, value: jsonEncode(userResponse));
  }

  Future<UserResponse> getUser() async {
    String? result = await flutterSecureStorage.read(key: _user);
    if (result != null && result.isNotEmpty) {
      Map<String, dynamic> userMap = jsonDecode(result);
      UserResponse userResponse = UserResponse.fromJson(userMap);
      return userResponse;
    }
    return UserResponse();
  }
}
