import 'package:Emend/models/address/add_address_response.dart';
import 'package:Emend/models/address/address_model.dart';

class AddressListResponse {
  int? status;
  String? message;
  Data? data;

  AddressListResponse({this.status, this.message, this.data});

  AddressListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<AddressModel>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AddressModel>[];
      json['data'].forEach((v) {
        data!.add(new AddressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
