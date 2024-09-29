import 'package:auth/app/price_apis.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartBottom extends StatefulWidget {
  CartBottom(
      {super.key,
      required this.prodcutsCount,
      required this.price,
      required this.btnText,
      required this.checkout});
  int prodcutsCount;
  double price;
  String btnText;
  Function() checkout;
  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 10.0), // Padding around content
        constraints: BoxConstraints(
            minHeight: 0), // Adjusts according to the content height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextGlobal(
              text: "(${widget.prodcutsCount}) ${S.of(context).products}",
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            TextGlobal(
                text: widget.price.toString().parsePrice(context),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                widget.checkout();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: GlobalColors.mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 50,
                child: Center(
                  child: TextGlobal(
                    text: widget.btnText,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
