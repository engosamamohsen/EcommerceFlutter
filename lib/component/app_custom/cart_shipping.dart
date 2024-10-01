import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartShipping extends StatelessWidget {
  CartShipping({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime newDate = now.add(Duration(days: 3));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.local_shipping_outlined),
        SizedBox(
          width: 5,
        ),
        TextGlobal(
          text: S.of(context).shipping_within_a_week_excluding_holidays,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )
      ],
    );
  }
}
