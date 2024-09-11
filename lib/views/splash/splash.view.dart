import 'dart:async';

import 'package:auth/core/app_color.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/views/auth/login.view.dart';
import 'package:auth/views/home/home_container.dart';
import 'package:auth/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStorage appStorage = AppStorage();
    Timer(const Duration(seconds: 2), () {
      // Get.to(const LoginView());

      appStorage.readToken().then((token) {
        print("token:$token");
        if (token != null && token.isNotEmpty) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return HomeContainer();
          }), (Route<dynamic> route) => false);
        } else {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return LoginView();
          }), (Route<dynamic> route) => false);
        }
      });
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
        child: Text(
          "Logo",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
