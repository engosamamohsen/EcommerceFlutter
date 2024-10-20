import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({required this.title,required this.checked,required this.onTap,super.key});

  String title;
  bool checked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextGlobal(text: title,color: (checked ? TColor.primary : TColor.secondary),
        fontSize: TSize.fontSizeMd,textAlign: TextAlign.center,),
    );
  }
}
