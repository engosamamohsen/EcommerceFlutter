import 'dart:convert';

import 'package:Emend/models/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageSharedShared {
  String _token = "TOKEN";
  String _user = "USER";

  Future<void> putToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, value);
  }

  Future<String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }

  Future<void> putKey(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Future<void> saveSessionData(String key, String value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(key, value);
  // }

  Future<String?> readKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key); // Returns null if not found
  }

  Future<void> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clearSessionData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> putUser(UserResponse userResponse) async {
    final prefs = await SharedPreferences.getInstance();
    await putToken(userResponse.data!.jwtToken!);
    await prefs.setString(_user, jsonEncode(userResponse));
  }

  Future<UserResponse> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? result = await prefs.getString(_user);
    if (result != null) {
      Map<String, dynamic> userMap = jsonDecode(result);
      UserResponse userResponse = UserResponse.fromJson(userMap);
      return userResponse;
    } // Returns null if not found
    return UserResponse();
  }

  // void putUser(UserResponse userResponse) {
  //   putToken(userResponse.data?.jwtToken);
  //   flutterSecureStorage.write(key: _user, value: jsonEncode(userResponse));
  // }

  // Future<UserResponse> getUser() async {
  //   String? result = await flutterSecureStorage.read(key: _user);
  //   if (result != null && result.isNotEmpty) {
  //     Map<String, dynamic> userMap = jsonDecode(result);
  //     UserResponse userResponse = UserResponse.fromJson(userMap);
  //     return userResponse;
  //   }
  //   return UserResponse();
  // }
}
