import 'dart:async';

import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/app/routes/const_routes_url.dart';
import 'package:Emend/app/routes/navigate_app_route.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/views/auth/login.view.dart';
import 'package:Emend/views/home/home_container.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:flutter/material.dart';

import '../../app/routes/get_app_route.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStorageShared appStorage = AppStorageShared();
    Timer(const Duration(seconds: 2), () {
      // Get.to(const LoginView());

      appStorage.readToken().then((token) {
        print("token:$token");
        if (token != null && token.isNotEmpty) {
          GetAppRoute.push(context, RouteUrlConst.HOME,
              removePrev: true);

          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (BuildContext context) {
          //   return HomeContainer();
          // }), (Route<dynamic> route) => false);
        } else {
          GetAppRoute.push(context, RouteUrlConst.LOGIN,
              removePrev: true);
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (BuildContext context) {
          //   return LoginView();
          // }), (Route<dynamic> route) => false);
        }
      });
    });
    return Scaffold(
      backgroundColor: TColor.primary,
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
