import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/views/address/list/address_list.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/contactus/contact_us_view.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/views/order/orders_list_view.dart';
import 'package:Emend/views/profile/edit_profile.dart';
import 'package:Emend/views/wishlist/wishlist_list_view.dart';
import 'package:flutter/material.dart';

import '../app/routes/const_routes_url.dart';
import '../app/routes/get_app_route.dart';
import '../db_helper/app_storage.dart';
import '../generated/l10n.dart';
import '../utils/constants/t_size.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({required this.selectPage ,required this.widgetPageSelect, super.key});

  Widget? selectPage;
  void Function(Widget) widgetPageSelect;

  @override
  State<AppDrawer> createState() => _DrawerViewState();

}

class _DrawerViewState extends State<AppDrawer> {
  AppStorageShared appStorage = AppStorageShared();
  String token = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appStorage.readToken().then((token) {
      print("token:$token");
      if (token != null && token.isNotEmpty) {
        setState(() {
          this.token = token;
        });;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSize.tabletScreenSize / 3,
      child: Container(
        decoration: BoxDecoration(
          color: TColor.white,
            // borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
            ]
        ),
        child: ListView(
          padding: EdgeInsets.zero, // Removes default padding
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(S.of(context).home),
              iconColor: (widget.selectPage is HomeView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is HomeView ?  TColor.primary : TColor.black),
              onTap: () {
                widget.selectPage = HomeView();
                widget.widgetPageSelect(HomeView());
                // Close the drawer and navigate to Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_view),
              title: Text(S.of(context).categories),
              iconColor: (widget.selectPage is CategoriesView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is CategoriesView ?  TColor.primary : TColor.black),
              onTap: () {
                widget.selectPage = CategoriesView();
                // widget.widgetPageSelect(CategoriesView());

                // Close the drawer and navigate to Settings
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.CATEGORIES);

                // You can implement navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text(S.of(context).orders),
              iconColor: (widget.selectPage is OrderListView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is OrderListView ?  TColor.primary : TColor.black),
              onTap: () {
                widget.selectPage = OrderListView();
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.ORDER_LIST);
                // Close the drawer and navigate to About
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(S.of(context).edit_profile),
              iconColor: (widget.selectPage is EditProfileView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is EditProfileView ?  TColor.primary : TColor.black),
              onTap: () {
                widget.selectPage = EditProfileView();
                // Close the drawer and navigate to About
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.EDIT_PROFILE);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline),
              iconColor: (widget.selectPage is WishListView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is WishListView ?  TColor.primary : TColor.black),
              title: Text(S.of(context).wishlist),
              onTap: () {
                widget.selectPage = WishListView();

                // Close the drawer and navigate to About
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.WISHLIST);
              },
            ),

            ListTile(
              leading: Icon(Icons.location_pin),
              iconColor: (widget.selectPage is AddressListView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is AddressListView ?  TColor.primary : TColor.black),
              title: Text(S.of(context).manage_address),
              onTap: () {
                widget.selectPage = AddressListView();
                // Close the drawer and navigate to About
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.ADDRESS_LIST);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support_outlined),
              iconColor: (widget.selectPage is ContactUsView ?  TColor.primary : TColor.black),
              textColor: (widget.selectPage is ContactUsView ?  TColor.primary : TColor.black),
              title: Text(S.of(context).contact_us),
              onTap: () {
                widget.selectPage = ContactUsView();
                // Close the drawer and navigate to About
                Navigator.pop(context);
                GetAppRoute.push(context, RouteUrlConst.CONTACT_US);
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              // iconColor: (widget.selectPage is ContactUsView ?  TColor.primary : TColor.black),
              // textColor: (widget.selectPage is ContactUsView ?  TColor.primary : TColor.black),
              title: Text(S.of(context).privacy_and_policy),
              onTap: () {
                // Close the drawer and navigate to About
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(token.isEmpty ? Icons.login : Icons.logout),
              title: Text(token.isEmpty ? S.of(context).login : S.of(context).logout),
              onTap: () {
                // Handle logout functionality
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
