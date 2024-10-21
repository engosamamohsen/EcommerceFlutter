import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/text.form.global.dart';
import '../component/text/text_global.dart';
import '../generated/l10n.dart';
import '../utils/constants/color.dart';
import '../utils/constants/t_size.dart';
import '../utils/device/device_utils.dart';

class HeaderHomeView extends StatefulWidget {
  HeaderHomeView({super.key,required this.clickMenu});

  void Function() clickMenu;
  @override
  State<HeaderHomeView> createState() => _HeaderHomeViewState();
}

class _HeaderHomeViewState extends State<HeaderHomeView> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TSize.sm),
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ], color: TColor.primary),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSize.paddingPage),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!DeviceUtils.isMobileScreen(context))
                IconButton(onPressed: widget.clickMenu, icon: Icon(color: TColor.white, Icons.menu)),

              const SizedBox(
                width: TSize.sm,
              ),
              TextGlobal(
                  color: TColor.white,
                  fontWeight: FontWeight.bold,
                  text:
                  "${S.of(context).welcome_in} ${S.of(context).app_name}"),
              const SizedBox(
                width: TSize.sm,
              ),
              if (!DeviceUtils.isMobileScreen(context))
                Flexible(
                    child: TextFormGlobal(
                        hint: S.of(context).search,
                        allowValidate: false,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        suffixIcon: IconButton(onPressed: () {
                          Scaffold.of(context).openDrawer();
                        }, icon: Icon(Icons.search,color: TColor.primary,)),

                        controller: searchController)),
              const Spacer(),
              if (DeviceUtils.isMobileScreen(context))
                Icon(color: TColor.white, Icons.search),
              const SizedBox(
                width: TSize.sm,
              ),
              Icon(
                Icons.circle_notifications,
                size: 40,
                color: TColor.white,
              )
            ],
          )
      ),
    );
  }
}
