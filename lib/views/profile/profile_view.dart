import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/login/login_response.dart';
import 'package:Emend/views/address/list/address_list.dart';
import 'package:Emend/views/auth/login.view.dart';
import 'package:Emend/views/contactus/contact_us_view.dart';
import 'package:Emend/views/order/orders_list_view.dart';
import 'package:Emend/views/profile/edit_profile.dart';
import 'package:Emend/views/profile/item_settings.dart';
import 'package:Emend/views/wishlist/wishlist_list_view.dart';
import 'package:Emend/widget/dialog/change_language_view.dart';
import 'package:Emend/widget/local/LocaleModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes/const_routes_url.dart';
import '../../app/routes/get_app_route.dart';

// import '../../restart/routes/navigate_app_route.dart';
import '../../widget/image/image_circle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserResponse? user;
  AppStorageShared appStorage = AppStorageShared();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      UserResponse fetchedUser = await appStorage.getUser();
      setState(() {
        user = fetchedUser;
      });
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
    }
  }

  Future<void> _logout() async {
    try {
      appStorage.removeToken();
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
    }
  }

  double imageWidth = 120;
  double imageHeight = 120;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            if (user != null)
              TImageCircle(
                  width: imageWidth,
                  height: imageHeight,
                  image: user != null &&
                          user!.data != null &&
                          user!.data!.image != null
                      ? user!.data!.image.toString()
                      : "")
            else
              SizedBox(
                width: imageWidth,
                height: imageHeight,
              ),
            TextGlobal(
              text:
                  user != null && user!.data != null && user!.data!.name != null
                      ? user!.data!.name.toString()
                      : AppLocalizations.of(context)!.guest,
              fontSize: 18,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.edit_profile,
              icon: Icons.person,
              submit: () {
                GetAppRoute.push(context, RouteUrlConst.EDIT_PROFILE);
                // GetAppRoute.push(context, RouteUrlConst.EDIT_PROFILE);
              },
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.manage_address,
              icon: Icons.location_pin,
              submit: () {
                // GetAppRoute.push(context, RouteUrlConst.ADDRESS_LIST);
                GetAppRoute.push(context, RouteUrlConst.ADDRESS_LIST);
              },
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.my_orders,
              icon: Icons.list_alt_outlined,
              submit: () {
                GetAppRoute.push(context, RouteUrlConst.ORDER_LIST);

                // GetAppRoute.push(context, RouteUrlConst.ORDER_LIST);
              },
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.wishlist,
              icon: Icons.favorite_outline,
              submit: () {
                GetAppRoute.push(context, RouteUrlConst.WISHLIST);

                // GetAppRoute.push(context, RouteUrlConst.WISHLIST);
              },
            ),
            SizedBox(
              height: 5,
            ),
            Consumer<LocaleModel>(
              builder: (context, localModel, child) => ItemSetting(
                text: AppLocalizations.of(context)!.change_language,
                icon: Icons.language_outlined,
                submit: () {
                  // GetAppRoute.push(context, RouteUrlConst.WISHLIST);
                  showDialog(
                      context: context,
                      builder: (context) => ChangeLanguageView(confirm: (language) {
                            print("welcome here");
                            // GetAppRoute.pop(context);
                            Navigator.of(context).pop();
                            localModel.set(Locale(language));
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
                  // GetAppRoute.push(context, RouteUrlConst.WISHLIST);
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.privacy_and_policy,
              icon: Icons.privacy_tip_outlined,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.contact_us,
              icon: Icons.contact_support_outlined,
              submit: () {
                GetAppRoute.push(context, RouteUrlConst.CONTACT_US);

                // GetAppRoute.push(context, RouteUrlConst.CONTACT_US);
              },
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: AppLocalizations.of(context)!.logout,
              icon: Icons.logout,
              submit: () {
                _logout();
                // GetAppRoute.replace(context, RouteUrlConst.LOGIN,
                //     removePrev: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
