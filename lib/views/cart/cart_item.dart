import 'package:auth/app/price_apis.dart';
import 'package:auth/component/app_custom/cart_shipping.dart';
import 'package:auth/component/image/image_round.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/cart/cart_list_response.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  CartItem(
      {super.key,
      required this.cart,
      this.showProgress = false,
      required this.add,
      required this.minus,
      required this.delete});
  CartModel cart;
  bool showProgress;
  Function() add;
  Function() minus;
  Function() delete;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: Colors.white,
            elevation: 5, // Controls the shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            margin: EdgeInsets.symmetric(
                vertical: 5, horizontal: 8), // Space around the card
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                ImageRound(
                  image: cart.image,
                  round: 20,
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextGlobal(
                        text: cart.name,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        maxLines: 2,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextGlobal(
                        text: cart.price.parsePrice(context),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: TextGlobal(
                            text: S
                                .of(context)
                                .shipping_within_a_week_excluding_holidays,
                            fontSize: 14,
                            maxLines: 2,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 25,
                              color: GlobalColors.secondaryColor,
                            ),
                            onPressed: add,
                          ),
                          TextGlobal(
                            text: cart.count,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 25,
                              color: GlobalColors.secondaryColor,
                            ),
                            onPressed: minus,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 25,
                              color: GlobalColors.secondaryColor,
                            ),
                            onPressed: delete,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            )),
        if (showProgress)
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: GlobalColors.mainColor,
                    strokeWidth: 2,
                  ),
                ),
              ))
      ],
    );
  }
}
