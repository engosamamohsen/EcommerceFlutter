import 'package:auth/component/app.bar.global.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: ListView(),
      )),
    );
  }
}
