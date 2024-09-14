import 'package:auth/component/text/text_global.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlobalAppBar({super.key, this.title = ""});

  String title;

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
