import 'package:Emend/app/app_color.dart';
import 'package:Emend/app/price_apis.dart';
import 'package:Emend/app_emend/emend.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/order/order_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  OrderItem({super.key, required this.order, this.selected});

  final OrderModel order;
  final VoidCallback? selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5, // Controls the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 16), // Space around the card
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: selected,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  TextGlobal(
                      fontSize: 14, text: "${S.of(context).order_number} : "),
                  const SizedBox(
                    width: 10,
                  ),
                  TextGlobal(
                    fontSize: 14,
                    color: Colors.black,
                    text: "#${order.id}",
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  ButtonGlobal(
                    text: EmendApp.getOrderStatus(context, order.orderStatus),
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
                      text: order.total.parsePrice(context)),
                  Spacer(),
                  TextGlobal(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.secondaryColor,
                      text: order.date),
                ],
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
