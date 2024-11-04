import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/routes/const_routes_url.dart';
import '../../generated/l10n.dart';
import '../../utils/constants/color.dart';
import 'menu_item_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TMenu extends StatefulWidget {
  TMenu({ Key? key}) : super(key: key);

  String positionSelect = RouteUrlConst.HOME;

  @override
  _TMenuState createState() => _TMenuState();
}

class _TMenuState extends State<TMenu> {
  late String _positionSelect;

  @override
  void initState() {
    super.initState();
    _positionSelect = widget.positionSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow for depth
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            MenuItem(
              title: AppLocalizations.of(context)!.home,
              checked: _positionSelect == RouteUrlConst.HOME,
              onTap: () {
                setState(() {
                  _positionSelect = RouteUrlConst.HOME;
                });
              },
            ),
            SizedBox(height: TSize.spaceBtwItems),
            MenuItem(
              title: AppLocalizations.of(context)!.categories,
              checked: _positionSelect == RouteUrlConst.CATEGORIES,
              onTap: () {
                setState(() {
                  _positionSelect = RouteUrlConst.CATEGORIES;
                });
              },
            ),
            SizedBox(height: TSize.spaceBtwItems),
            MenuItem(
              title: AppLocalizations.of(context)!.cart,
              checked: _positionSelect == RouteUrlConst.CART,
              onTap: () {
                setState(() {
                  _positionSelect = RouteUrlConst.CART;
                });
              },
            ),
            SizedBox(height: TSize.spaceBtwItems),
            MenuItem(
              title: AppLocalizations.of(context)!.profile,
              checked: _positionSelect == RouteUrlConst.PROFILE,
              onTap: () {
                setState(() {
                  _positionSelect = RouteUrlConst.PROFILE;
                });
              },
            ),

            SizedBox(height: TSize.spaceBtwItems),
            MenuItem(
              title: AppLocalizations.of(context)!.orders,
              checked: _positionSelect == RouteUrlConst.ORDER_LIST,
              onTap: () {
                setState(() {
                  _positionSelect = RouteUrlConst.ORDER_LIST;
                });
              },
            ),
            SizedBox(height: TSize.spaceBtwItems),

          ],
        ),
      ),
    );
  }
}
