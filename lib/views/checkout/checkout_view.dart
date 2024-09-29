import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/cart/cart_cubit.dart';
import 'package:auth/cubit/cart/cart_state.dart';
import 'package:auth/cubit/order/order_cubit.dart';
import 'package:auth/cubit/order/order_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/cart/cart_list_response.dart';
import 'package:auth/views/cart/cart_bottom.dart';
import 'package:auth/views/cart/cart_item.dart';
import 'package:auth/views/profile/item_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView(
      {super.key, required this.carts, required this.totalAfterDiscount});
  List<CartModel> carts = [];
  double totalAfterDiscount = 0;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String address = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalColors.backGroundColor,
            appBar: GlobalAppBar(
              title: S.of(context).checkout,
              showBackBtn: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.carts.length,
                    itemBuilder: (context, item) {
                      return CartItem(
                        cart: widget.carts[item],
                        add: () {},
                        minus: () {},
                        delete: () {},
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                ItemSetting(
                  text: S.of(context).please_select_your_address,
                  icon: Icons.location_pin,
                  submit: () {},
                ),
                if (address.isNotEmpty) ...[
                  SizedBox(
                    height: 10,
                  ),
                  TextGlobal(
                    text: address,
                    fontSize: 14,
                  )
                ],
                SizedBox(
                  height: 10,
                ),
                CartBottom(
                  prodcutsCount: widget.carts.length,
                  price: widget.totalAfterDiscount,
                  btnText: S.of(context).make_order,
                  checkout: () {
                    BlocProvider.of<OrderCubit>(context).checkout();
                  },
                )
              ],
            ),
          );
        });
  }
}
