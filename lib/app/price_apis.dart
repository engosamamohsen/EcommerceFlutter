import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

extension PriceParsing on String {
  String parsePrice(BuildContext context) {
    return "${double.parse(this).toStringAsFixed(2)} ${S.of(context).currency}";
  }
}

// price: 3
// 3.00 EGP