import 'package:Emend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmendApp {
  /*
انشاء الطلب
جارى تجهيز الطلب
فى الطريق
تم التسليم
  */
  static String getOrderStatus(BuildContext context, int orderStatus) {
    switch (orderStatus) {
      case 1:
        return AppLocalizations.of(context)!.create_order;
      case 2:
        return AppLocalizations.of(context)!.processing;
      case 3:
        return AppLocalizations.of(context)!.in_the_way;
      case 4:
        return AppLocalizations.of(context)!.delivered;
      default:
        return AppLocalizations.of(context)!.delivered;
    }
  }

  static String getPaymentType(BuildContext context, int orderType) {
    switch (orderType) {
      case 1:
        return AppLocalizations.of(context)!.cash;
      case 2:
        return AppLocalizations.of(context)!.delivery;
    }
    return "";
  }
}
