import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:auth/models/order/order_response.dart';
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
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  // TextGlobal(
                  //     fontSize: 14,
                  //     color: Colors.black,
                  //     text:
                  //         "${order.address.governorate.name.toString()} - ${address.city.name.toString()}"),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  // TextGlobal(
                  //     fontSize: 14,
                  //     color: Colors.black,
                  //     text:
                  //         "${S.of(context).building} (${address.building.toString()}) - ${S.of(context).floor} (${address.floor.toString()}) - ${S.of(context).flat} (${address.flat.toString()})"),
                  Spacer(),
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
