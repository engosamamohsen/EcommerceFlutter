import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showDialogSimple(
      BuildContext context,
      String title,
      String content,
      String txtConfirm,
      String txtCancel,
      Function() confrimClick,
      Function() cancelClick) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextGlobal(
            text: title,
            color: TColor.primary,
            fontSize: 16,
          ),
          content: TextGlobal(
            text: content,
            color: Colors.black,
            fontSize: 14,
          ),
          actions: [
            TextButton(
              child: TextGlobal(
                text: txtConfirm,
                color: Colors.black,
                fontSize: 14,
              ),
              onPressed: () {
                confrimClick();
              },
            ),
            TextButton(
              child: TextGlobal(
                text: txtCancel,
                color: Colors.black,
                fontSize: 14,
              ),
              onPressed: () {
                cancelClick();
              },
            ),
          ],
        );
      },
    );
  }
}
