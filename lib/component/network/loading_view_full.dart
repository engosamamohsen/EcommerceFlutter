import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class LoadingViewFull extends StatelessWidget {
  const LoadingViewFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(
        color: TColor.primary,
        strokeWidth: 1,
      )),
    );
  }
}
