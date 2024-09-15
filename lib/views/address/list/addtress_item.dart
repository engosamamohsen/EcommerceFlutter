import 'package:auth/component/text/text_global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  AddressItem({super.key, required this.address, required this.delete});

  final AddressModel address;
  void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Shadow color
            blurRadius: 10, // Softness of the shadow
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 16), // Margin for spacing around the item
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_city),
              SizedBox(
                width: 10,
              ),
              TextGlobal(
                  fontSize: 14,
                  color: Colors.black,
                  text:
                      "${address.governorate.name.toString()} - ${address.city.name.toString()}"),
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
              TextGlobal(
                  fontSize: 14,
                  color: Colors.black,
                  text:
                      "${S.of(context).building} (${address.building.toString()}) - ${S.of(context).floor} (${address.floor.toString()}) - ${S.of(context).flat} (${address.flat.toString()})"),
              Spacer(), // Pushes the delete icon to the right
              InkWell(
                onTap: delete,
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
