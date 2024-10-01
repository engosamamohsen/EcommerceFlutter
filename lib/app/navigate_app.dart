import 'package:flutter/material.dart';

class NavigateApp {
  static void navigateWithClear(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }), (Route<dynamic> route) => false);
  }

  static void navigate(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }

  static void navigateWithParameter<T>(BuildContext context,
      Widget Function(BuildContext, T) builder, T parameter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return builder(context, parameter);
        },
      ),
    );
  }
}
