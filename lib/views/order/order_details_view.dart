import 'package:Emend/app/app_color.dart';
import 'package:Emend/app/app_constants.dart';
import 'package:Emend/app/price_apis.dart';
import 'package:Emend/app_emend/emend.dart';
import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/order/order_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/models/order/details/order_details_response.dart';
import 'package:Emend/views/address/list/address_item.dart';
import 'package:Emend/views/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsView extends StatefulWidget {
  OrderDetailsView({super.key, required this.orderId});
  List<CartModel> carts = [];
  OrderDetailsResponse? orderDetailsResponse;
  int orderId = -1;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<OrderCubit>(context).orderDetails(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderCubit, OrderStates>(listener: (context, state) {
          if (state is OrderSuccessState<OrderDetailsResponse>) {
            setState(() {
              widget.orderDetailsResponse = state.data!;
              widget.carts.clear();
              for (var product
                  in widget.orderDetailsResponse!.data!.orderProducts) {
                widget.carts.add(CartModel(
                    id: product.id,
                    productId: product.id,
                    name: product.productName,
                    category: null,
                    description: "",
                    price: product.productPrice,
                    discount: "0",
                    priceAfter: product.productPrice,
                    image: "",
                    count: product.qty));
              }
            });
          }
        })
      ],
      child: BlocConsumer<OrderCubit, OrderStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: GlobalColors.backGroundColor,
              appBar: GlobalAppBar(
                title: S.of(context).order_details,
                showBackBtn: true,
              ),
              body: widget.orderDetailsResponse != null
                  ? Padding(
                      padding: EdgeInsets.all(GlobalConstants.paddingPage),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          TextGlobal(
                            text: S.of(context).order_info,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          orderItemView(
                              widget.orderDetailsResponse!.data!.id,
                              widget.orderDetailsResponse!.data!.orderStatus,
                              widget.orderDetailsResponse!.data!.total,
                              widget.orderDetailsResponse!.data!.date),
                          const SizedBox(height: 40),
                          TextGlobal(
                            text: S.of(context).items_info,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: (150 * widget.carts.length).toDouble(),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.carts.length,
                              itemBuilder: (context, item) {
                                return CartItem(
                                  cart: widget.carts[item],
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
                          // const SizedBox(height: 12),
                          TextGlobal(
                            text: S.of(context).address_info,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 8),
                          if (widget.orderDetailsResponse?.data!.address !=
                              null)
                            AddressItem(
                                address: widget
                                    .orderDetailsResponse!.data!.address!),
                          // const SizedBox(height: 12),
                          // TextGlobal(
                          //   text: S.of(context).payment_info,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          // SizedBox(height: 12),
                          Card(
                            color: Colors.white,
                            elevation: 5, // Controls the shadow
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextGlobal(
                                    text: S.of(context).payment_method,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextGlobal(
                                    text: EmendApp.getPaymentType(
                                        context,
                                        widget.orderDetailsResponse!.data!
                                            .orderType),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Card(
                            color: Colors.white,
                            elevation: 5, // Controls the shadow
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextGlobal(
                                    text: S.of(context).total,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                  TextGlobal(
                                      text: widget
                                          .orderDetailsResponse!.data!.total
                                          .toString()
                                          .parsePrice(context),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : state is OrderLoadingState
                      ? const LoadingViewFull()
                      : const NetworkError(),
            );
          }),
    );
  }

  orderItemView(int orderId, int orderStatus, String total, String date) {
    return Card(
      color: Colors.white,
      elevation: 5, // Controls the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: EdgeInsets.symmetric(
          vertical: 5, horizontal: 8), // Space around the card
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 8,
            ),
            Row(
              children: [
                TextGlobal(
                  fontSize: 14,
                  text: "${S.of(context).order_number} : ",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextGlobal(
                  fontSize: 14,
                  color: Colors.black,
                  text: "#$orderId",
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                ButtonGlobal(
                  text: EmendApp.getOrderStatus(context, orderStatus),
                  radius: 30,
                  height: 20,
                  fontSize: 10,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                TextGlobal(
                  fontSize: 14,
                  text: "${S.of(context).total} : ",
                ),
                const SizedBox(
                  width: 10,
                ),
                TextGlobal(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    text: total.parsePrice(context)),
                Spacer(),
                TextGlobal(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.secondaryColor,
                    text: date),
              ],
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
