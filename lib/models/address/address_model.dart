import 'package:Emend/models/address/governates_response.dart';

//osama
class AddressModel {
  AddressModel({
    //  this.customerId,
    this.street = "",
    this.building = "",
    this.floor = "",
    this.flat = "",
    this.specialSign = "",
    this.shipping = "",
    required this.governorate,
    required this.city,
    this.id = 0,
  });
  // late final int customerId;
  late final String street;
  late final String building;
  late final String floor;
  late final String flat;
  late final String specialSign;
  late final String shipping;
  late final Governorates governorate;
  late final Cities city;
  late final int id;

  AddressModel.fromJson(Map<String, dynamic> json) {
    // customerId = json['customer_id'];
    try {
      street = json['street'];
      building = json['building'];
      floor = json['floor'];
      flat = json['flat'];
      specialSign = json['special_sign'];
      shipping = json['shipping'];
      governorate = Governorates.fromJson(json['governorate']);
      city = Cities.fromJson(json['city']);
      id = json['id'];
    } catch (e) {
      print("error $e");
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['customer_id'] = customerId;
    _data['street'] = street;
    _data['building'] = building;
    _data['floor'] = floor;
    _data['flat'] = flat;
    _data['special_sign'] = specialSign;
    _data['shipping'] = shipping;
    _data['governorate'] = governorate;
    _data['city'] = city;
    _data['id'] = id;
    return _data;
  }
}
