import 'package:Emend/app/routes/get_app_route.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:flutter/material.dart';

import '../../app/routes/navigate_app_route.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlobalAppBar(
      {super.key,
      this.title = "",
      this.showBackBtn = true,
      this.suffixIcon,
      this.onSuffixIconPressed,
      this.onBackIconPressed});

  String title;
  IconData? suffixIcon;
  bool showBackBtn;
  Function()? onSuffixIconPressed;
  Function()? onBackIconPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
          ]),
      child: AppBar(
        backgroundColor: Colors.transparent, // Set to transparent
        elevation: 0, // Remove default AppBar elevation
        centerTitle: true,
        title: title.isNotEmpty
            ? TextGlobal(
                text: title,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            : null,
        leading: (showBackBtn
            ? IconButton(
                onPressed: () {
                  onBackIconPressed == null
                      ? GetAppRoute.pop(context)
                      : onBackIconPressed!();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ))
            : null),
        actions: suffixIcon != null
            ? [
                IconButton(
                  onPressed: onSuffixIconPressed,
                  icon: Icon(
                    suffixIcon,
                    color: Colors.black,
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
