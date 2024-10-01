import 'package:Emend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

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
        return S.of(context).create_order;
      case 2:
        return S.of(context).processing;
      case 3:
        return S.of(context).in_the_way;
      case 4:
        return S.of(context).delivered;
      default:
        return S.of(context).delivered;
    }
  }

  static String getPaymentType(BuildContext context, int orderType) {
    switch (orderType) {
      case 1:
        return S.of(context).cash;
      case 2:
        return S.of(context).delivery;
    }
    return "";
  }
}
