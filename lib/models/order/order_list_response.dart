import 'package:Emend/models/order/order_model.dart';

class OrdersListResponse {
  OrdersListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory OrdersListResponse.fromJson(Map<String, dynamic> json) {
    return OrdersListResponse(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return "$status, $message, $data, ";
  }
}

class Data {
  Data({
    required this.data,
  });

  final List<OrderModel> data;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json["data"] == null
          ? []
          : List<OrderModel>.from(
              json["data"]!.map((x) => OrderModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$data, ";
  }
}
