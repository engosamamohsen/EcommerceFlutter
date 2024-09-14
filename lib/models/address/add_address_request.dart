class AddAddressRequest {
  AddAddressRequest({
    required this.customer_id,
    required this.governorate_id,
    required this.city_id,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
    required this.flat,
    required this.special_sign,
  });
  late final int customer_id;
  late final int governorate_id;
  late final int city_id;
  late final String area;
  late final String street;
  late final String building;
  late final String floor;
  late final String flat;
  late final String special_sign;

  Map<String, dynamic> toMap() {
    final _data = <String, dynamic>{};
    _data['customer_id'] = customer_id;
    _data['governorate_id'] = governorate_id;
    _data['city_id'] = city_id;
    _data['area'] = area;
    _data['street'] = street;
    _data['building'] = building;
    _data['floor'] = floor;
    _data['flat'] = flat;
    _data['special_sign'] = special_sign;
    _data['shipping'] = "0";
    return _data;
  }
}
