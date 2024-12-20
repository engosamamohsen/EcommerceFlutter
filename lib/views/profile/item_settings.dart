import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {super.key,
      required this.text,
      required this.icon,
      required this.submit});
  final String text;
  final IconData icon;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: TColor.primary,
        ),
        title: TextGlobal(
          text: text,
          color: Colors.black,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: TColor.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: TColor.primary, width: 1),
        ),
        onTap: submit,
      ),
    );
  }
}
