import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.white,
        border: Border(bottom: BorderSide(color: TColor.grey, width: 1)),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: TSize.md, vertical: TSize.sm),
      child: AppBar(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(TSize.appBarHeight);
}
