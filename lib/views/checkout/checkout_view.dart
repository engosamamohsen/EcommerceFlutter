import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/app/app_color.dart';
import 'package:Emend/cubit/address/address_cubit.dart';
import 'package:Emend/cubit/address/address_state.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/order/order_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/address/add_address_response.dart';
import 'package:Emend/models/address/address_list_response.dart';
import 'package:Emend/models/address/address_model.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/models/order/order_list_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/utils/toast_message.dart';
import 'package:Emend/views/address/list/address_item.dart';
import 'package:Emend/views/address/list/address_list.dart';
import 'package:Emend/views/cart/cart_bottom.dart';
import 'package:Emend/views/cart/cart_item.dart';
import 'package:Emend/views/checkout/checkout_success_view.dart';
import 'package:Emend/views/profile/item_settings.dart';
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
  List<AddressModel>? addressList;

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
          if (state is OrderSuccessState<BaseResponse>) {
            ToastMessageHelper.showToastMessage(state.data!.message);
            // i want to navigate here to Home Screen
            // Navigate back to HomeView and ensure the Home tab is selected
            // Navigator.pop(context);
            // BlocProvider.of<BottomNavigationCubit>(context)
            //     .updateTabIndex(HomeView());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CheckoutSuccessView()),
            );
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
                                showProgress: false,
                                allowActions: false,
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
                        const SizedBox(height: 4),
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
