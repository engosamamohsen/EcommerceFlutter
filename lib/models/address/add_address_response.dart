import 'package:Emend/models/address/governates_response.dart';

class AddAddressResponse {
  AddAddressResponse({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  AddAddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
