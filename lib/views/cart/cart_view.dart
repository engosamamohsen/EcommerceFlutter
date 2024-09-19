import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: S.of(context).cart,
        showBackBtn: false,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 200,
          itemBuilder: (context, item) {
            return Text("welcome");
          }),
      bottomNavigationBar: Container(
        color: GlobalColors.mainColor,
        height: 50,
        child: Center(
          child: TextGlobal(
            text: S.of(context).checkout,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
