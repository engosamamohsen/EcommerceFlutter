import 'package:Emend/views/home/home_container.dart';
import 'package:Emend/widget/dialog/change_language_view.dart';
import 'package:Emend/widget/local/LocaleModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../app/routes/const_routes_url.dart';
import '../app/routes/get_app_route.dart';
import '../component/text.form.global.dart';
import '../component/text/text_global.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../utils/constants/color.dart';
import '../utils/constants/t_size.dart';
import '../utils/device/device_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderHomeView extends StatefulWidget {
  HeaderHomeView({super.key, required this.clickMenu});

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
                IconButton(
                    onPressed: widget.clickMenu,
                    icon: Icon(color: TColor.white, Icons.menu)),
              const SizedBox(
                width: TSize.sm,
              ),
              TextGlobal(
                  color: TColor.white,
                  fontWeight: FontWeight.bold,
                  text:
                      "${AppLocalizations.of(context)!.welcome_in} ${AppLocalizations.of(context)!.app_name}"),
              const SizedBox(
                width: TSize.sm,
              ),
              if (!DeviceUtils.isMobileScreen(context))
                Flexible(
                    child: TextFormGlobal(
                        hint: AppLocalizations.of(context)!.search,
                        allowValidate: false,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        suffixIcon: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              Icons.search,
                              color: TColor.primary,
                            )),
                        controller: searchController)),
              const Spacer(),
              if (DeviceUtils.isMobileScreen(context))
                Icon(color: TColor.white, Icons.search),
              if (DeviceUtils.isTabletScreen(context))
                const SizedBox(
                  width: TSize.sm,
                ),
              if (DeviceUtils.isTabletScreen(context))
                Consumer<LocaleModel>(
                    builder: (context, localModel, child) => IconButton(
                          icon: const Icon(Icons.language_outlined),
                          iconSize: 30,
                          color: TColor.white,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    ChangeLanguageView(confirm: (language) {

                                      print("welcome here");
                                      // GetAppRoute.pop(context);
                                      Navigator.of(context).pop();
                                      localModel.set(Locale(language));
                                      Phoenix.rebirth(Get.context!); // Restarting app
                                      Get.reset(); // resetting getx

                                      // Get.offAll(() => const MyApp());
                                      // GetAppRoute.pop(context);
                                      // GetAppRoute.push(context, RouteUrlConst.HOME,removePrev: true);
                                      // Get.offAll(() => const MyApp());

                                      // RestartWidget.restartApp(context);
                                      // Restart.restartApp(
                                      //   /// In Web Platform, Fill webOrigin only when your new origin is different than the app's origin
                                      //   // webOrigin: 'http://example.com',
                                      //
                                      //   // Customizing the notification message only on iOS
                                      //   notificationTitle: 'Restarting App',
                                      //   notificationBody: 'Please tap here to open the app again.',
                                      // );
                                    }));

                            //how to showDialog ChangeLanguageView
                          },
                        )),
              const SizedBox(
                width: TSize.sm,
              ),
              Icon(
                Icons.circle_notifications,
                size: 40,
                color: TColor.white,
              )
            ],
          )),
    );
  }
}
