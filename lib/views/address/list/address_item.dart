import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  AddressItem(
      {super.key,
      required this.address,
      this.isFromCheckout = false,
      this.isSelected = false,
      this.delete,
      this.selected});

  final bool isFromCheckout;
  final bool isSelected;
  final AddressModel address;
  void Function()? delete;
  final VoidCallback? selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5, // Controls the shadow
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              width: isFromCheckout && isSelected ? 2 : 0,
              color: GlobalColors.mainColor) // Rounded corners
          ),
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 16), // Space around the card
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: isFromCheckout ? selected : null,
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
                  Spacer(),
                  if (!isFromCheckout) // Pushes the delete icon to the right
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
        ),
      ),
    );
  }
}
