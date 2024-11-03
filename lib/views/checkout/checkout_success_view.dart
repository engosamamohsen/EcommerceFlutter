import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/address/address_cubit.dart';
import 'package:Emend/cubit/address/address_state.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/order/order_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/address/add_address_response.dart';
import 'package:Emend/models/address/address_list_response.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/models/order/order_model.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/utils/toast_message.dart';
import 'package:Emend/views/address/list/address_list.dart';
import 'package:Emend/views/address/list/address_item.dart';
import 'package:Emend/views/cart/cart_bottom.dart';
import 'package:Emend/views/cart/cart_item.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/views/profile/item_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutSuccessView extends StatefulWidget {
  CheckoutSuccessView({super.key});

  @override
  State<CheckoutSuccessView> createState() => _CheckoutSuccessViewState();
}

class _CheckoutSuccessViewState extends State<CheckoutSuccessView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: AppLocalizations.of(context)!.complete,
        showBackBtn: true,
        onBackIconPressed: () {
          Navigator.pop(context);
          BlocProvider.of<BottomNavigationCubit>(context)
              .updateTabIndex(HomeView());
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "${GlobalAssets.imagesVectorAssetsPath}success_bag.svg",
                height: 200.0,
                width: 200.0,
              ),
              SizedBox(
                height: 20,
              ),
              TextGlobal(
                text: AppLocalizations.of(context)!.success,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              TextGlobal(
                text: AppLocalizations.of(context)!.your_order_will_be_delivered_soon,
                fontSize: 16,
                color: Colors.black,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 8,
              ),
              TextGlobal(
                text: AppLocalizations.of(context)!.thank_you_for_choosing_our_app,
                fontSize: 16,
                color: Colors.black,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonGlobal(
                text: AppLocalizations.of(context)!.continue_shopping,
                radius: 30,
                onTap: () {
                  Navigator.pop(context);
                  BlocProvider.of<BottomNavigationCubit>(context)
                      .updateTabIndex(HomeView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
