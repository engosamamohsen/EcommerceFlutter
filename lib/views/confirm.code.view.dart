import 'package:auth/component/app.bar.global.dart';
import 'package:flutter/material.dart';

class ConfirmCodeView extends StatelessWidget {
  const ConfirmCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [],
        ),
      )),
    );
  }
}
