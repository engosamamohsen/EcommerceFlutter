import 'package:auth/core/app_color.dart';
import 'package:flutter/material.dart';

class LoadingViewFull extends StatelessWidget {
  const LoadingViewFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(
        color: GlobalColors.mainColor,
        strokeWidth: 1,
      )),
    );
  }
}
