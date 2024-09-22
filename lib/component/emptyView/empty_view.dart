import 'package:auth/component/text/text_global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  EmptyView({super.key, required this.textMsg});

  String textMsg = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextGlobal(
        text: textMsg,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
