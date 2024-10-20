import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/app/price_apis.dart';
import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/emptyView/empty_view.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/cart/cart_cubit.dart';
import 'package:Emend/cubit/cart/cart_state.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/views/cart/cart_bottom.dart';
import 'package:Emend/views/cart/cart_item.dart';
import 'package:Emend/views/checkout/checkout_view.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int position = -1;
  List<CartModel> carts = [];
  double totalAfterDiscount = 0;
  double totalBeforeDiscount = 0;
  int productCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().getCarts();
    });
  }

  void recalculate() {
    setState(() {
      totalBeforeDiscount = 0;
      totalAfterDiscount = 0;
      for (var cartItem in carts) {
        totalBeforeDiscount +=
            (int.parse(cartItem.count) * double.parse(cartItem.price));
        totalAfterDiscount +=
            (int.parse(cartItem.count) * double.parse(cartItem.priceAfter));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is CartSuccessState<CartListResponse>) {
          setState(() {
            if (state.data?.data?.data != null) {
              carts.clear();
              totalAfterDiscount = 0;
              totalBeforeDiscount = 0;
              carts.addAll(state.data!.data!.data);
              recalculate();
            }
          });
        }
        if (state is CartSuccessAddMinusState && position < carts.length) {
          setState(() {
            carts[position].count = productCount.toString();
            position = -1;
            recalculate();
          });
        }
        if (state is CartDeteteState && position < carts.length) {
          setState(() {
            carts.removeAt(position);
            position = -1;
            recalculate();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: TColor.backGroundColor,
          appBar: GlobalAppBar(
            title: S.of(context).cart,
            showBackBtn: false,
          ),
          body: state is CartLoadingState
              ? const LoadingViewFull()
              : state is CartSuccessState ||
                      state is CartAddMinusState ||
                      state is CartSuccessAddMinusState ||
                      state is CartDeteteState
                  ? carts.isEmpty
                      ? EmptyView(
                          textMsg: S.of(context).your_cart_is_empty,
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: carts.length,
                          itemBuilder: (context, item) {
                            return CartItem(
                              cart: carts[item],
                              showProgress: state is CartAddMinusState ||
                                  state is CartDeteteState,
                              add: () {
                                position = item;
                                setState(() {
                                  productCount =
                                      int.parse(carts[item].count) + 1;
                                });
                                BlocProvider.of<CartCubit>(context).addToCart(
                                    carts[item].productId,
                                    (int.parse(carts[item].count) + 1)
                                        .toString());
                              },
                              minus: () {
                                position = item;
                                setState(() {
                                  productCount =
                                      int.parse(carts[item].count) - 1;
                                });
                                BlocProvider.of<CartCubit>(context).addToCart(
                                    carts[item].productId,
                                    (int.parse(carts[item].count) - 1)
                                        .toString());
                              },
                              delete: () {
                                position = item;
                                BlocProvider.of<CartCubit>(context)
                                    .deleteCart(cartId: carts[item].id);
                              },
                            );
                          })
                  : state is CartFailedState
                      ? NetworkError()
                      : Center(
                          child: TextGlobal(
                              text: S.of(context).loading_please_wait),
                        ),
          bottomNavigationBar: carts.isNotEmpty
              ? CartBottom(
                  prodcutsCount: carts.length,
                  price: totalAfterDiscount,
                  btnText: S.of(context).checkout,
                  checkout: () {
                    // print("welcome here");
                    NavigateApp.navigate(
                        context,
                        CheckoutView(
                            carts: carts,
                            totalAfterDiscount: totalAfterDiscount));

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //   return CheckoutView(
                    //       carts: carts, totalAfterDiscount: totalAfterDiscount);
                    // })).then((result) {
                    //   if (result == "checkout") {
                    //     setState(() {
                    //       BlocProvider.of<BottomNavigationCubit>(context)
                    //           .updateTabIndex(HomeView());
                    //     });
                    //   }
                    // });

                    /*
Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return CheckoutSuccessView();
            })).then((result) {
              setState(() {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .updateTabIndex(HomeView());
              });
            });
                            */
                  },
                )
              : null,
        );
      },
    );
  }

  // Widget cartBottom(count, double price, Function() checkout) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8, right: 8),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10), topRight: Radius.circular(10))),
  //       padding: const EdgeInsets.symmetric(
  //           horizontal: 16.0, vertical: 10.0), // Padding around content
  //       constraints: BoxConstraints(
  //           minHeight: 0), // Adjusts according to the content height
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           TextGlobal(
  //             text: "($count) ${S.of(context).products}",
  //             fontSize: 14,
  //             fontWeight: FontWeight.normal,
  //             color: Colors.black,
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           TextGlobal(
  //               text: price.toString().parsePrice(context),
  //               fontSize: 16,
  //               fontWeight: FontWeight.normal,
  //               color: Colors.black),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           InkWell(
  //             onTap: () {
  //               checkout();
  //             },
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: GlobalColors.mainColor,
  //                   borderRadius: BorderRadius.all(Radius.circular(30))),
  //               height: 50,
  //               child: Center(
  //                 child: TextGlobal(
  //                   text: S.of(context).checkout,
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
