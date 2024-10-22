import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';

import '../text/text_global.dart';

class AppTextBar extends StatelessWidget {
  AppTextBar({super.key,required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return TextGlobal(
      text: title,
      fontSize: TSize.fontSizeMd,
      color: TColor.black,
      fontWeight: FontWeight.bold,
    );
  }
}
