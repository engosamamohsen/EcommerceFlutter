import 'package:auth/app/navigate_app.dart';
import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/address/address_cubit.dart';
import 'package:auth/cubit/address/address_state.dart';
import 'package:auth/cubit/cart/cart_cubit.dart';
import 'package:auth/cubit/cart/cart_state.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/cubit/order/order_cubit.dart';
import 'package:auth/cubit/order/order_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:auth/models/address/address_list_response.dart';
import 'package:auth/models/cart/cart_list_response.dart';
import 'package:auth/models/order/order_response.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:auth/views/address/list/address_list.dart';
import 'package:auth/views/address/list/address_item.dart';
import 'package:auth/views/cart/cart_bottom.dart';
import 'package:auth/views/cart/cart_item.dart';
import 'package:auth/views/home/home_view.dart';
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
  int address_id = -1;
  double shipping = 0;
  List<AddressModel>? addressList = null;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AddressCubit>(context).getAddressList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddressCubit, AddressStates>(listener: (context, state) {
          if (state is AddressSuccessState<AddressListResponse>) {
            if (state.data.data?.data != null) {
              setState(() {
                addressList = state.data.data!.data!;
              });
            }
          }
        }),
        BlocListener<OrderCubit, OrderStates>(listener: (context, state) {
          if (state is OrderSuccessState<OrderResponse>) {
            ToastMessageHelper.showToastMessage(state.data!.message);
            // i want to navigate here to Home Screen
            // Navigate back to HomeView and ensure the Home tab is selected
            Navigator.pop(context);
            BlocProvider.of<BottomNavigationCubit>(context)
                .updateTabIndex(HomeView());
          }
        })
      ],
      child: BlocConsumer<OrderCubit, OrderStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: GlobalColors.backGroundColor,
              appBar: GlobalAppBar(
                title: S.of(context).checkout,
                showBackBtn: true,
              ),
              body: addressList != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   child:
                        SizedBox(
                          height: (150 * widget.carts.length).toDouble(),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: widget.carts.length,
                            itemBuilder: (context, item) {
                              return CartItem(
                                cart: widget.carts[item],
                                add: () {},
                                minus: () {},
                                delete: () {},
                              );
                            },
                          ),
                        ),
                        // ),
                        // Text("adsasd"),
                        // SizedBox(height: 10),
                        // Text("asdas"),
                        ItemSetting(
                          text: S.of(context).please_select_your_address,
                          icon: Icons.location_pin,
                          submit: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return AddressListView(
                                addressList: addressList,
                              );
                            })).then((result) {
                              setState(() {
                                address_id = -1;
                                addressList = result;
                              });
                            });
                          },
                        ),
                        SizedBox(height: 4),
                        Expanded(
                          child: ListView.builder(
                              itemCount: addressList!.length,
                              itemBuilder: (context, item) {
                                return AddressItem(
                                    address: addressList![item],
                                    isFromCheckout: true,
                                    isSelected:
                                        address_id == addressList![item].id,
                                    selected: () {
                                      print("address id here");
                                      setState(() {
                                        address_id = addressList![item].id;
                                        print("address Id $address_id");
                                      });
                                    });
                              }),
                        ),
                        SizedBox(height: 10),
                        CartBottom(
                          prodcutsCount: widget.carts.length,
                          price: widget.totalAfterDiscount,
                          btnText: S.of(context).make_order,
                          showProgress:
                              state is OrderLoadingState ? true : false,
                          checkout: () {
                            if (address_id == -1) {
                              ToastMessageHelper.showErrorMessage(
                                  "${S.of(context).please_enter} ${S.of(context).your_address}");
                              return;
                            }
                            BlocProvider.of<OrderCubit>(context)
                                .checkout(address_id, shipping);
                          },
                        )
                      ],
                    )
                  : const LoadingViewFull(),
            );
          }),
    );
  }
}
