import 'package:Emend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension PriceParsing on String {
  String parsePrice(BuildContext context) {
    return "${double.parse(this).toStringAsFixed(2)} ${AppLocalizations.of(context)!.currency}";
  }
}

// price: 3
// 3.00 EGP