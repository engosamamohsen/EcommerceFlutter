import 'dart:async';

import 'package:auth/utils/global.colors.dart';
import 'package:auth/views/login.view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      // Get.to(const LoginView());

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginView();
      }));
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
