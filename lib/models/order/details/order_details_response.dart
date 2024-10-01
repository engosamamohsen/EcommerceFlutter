import 'package:Emend/models/address/add_address_response.dart';
import 'package:Emend/models/address/address_model.dart';

class OrderDetailsResponse {
  OrderDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailsResponse(
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
    required this.id,
    required this.cashier,
    required this.orderType,
    required this.orderStatus,
    required this.tableId,
    required this.subTotal,
    required this.shipping,
    required this.total,
    required this.customerId,
    required this.customerPhone,
    required this.customerName,
    required this.address,
    required this.date,
    required this.orderProducts,
    required this.deliveryId,
    required this.delivery,
  });

  final int id;
  final String cashier;
  final int orderType;
  final int orderStatus;
  final int tableId;
  final String subTotal;
  final String shipping;
  final String total;
  final int customerId;
  final dynamic customerPhone;
  final dynamic customerName;
  final AddressModel? address;
  final String date;
  final List<OrderProduct> orderProducts;
  final int deliveryId;
  final int delivery;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      cashier: json["cashier"] ?? "",
      orderType: json["order_type"] ?? 0,
      orderStatus: json["order_status"] ?? 0,
      tableId: json["table_id"] ?? 0,
      subTotal: json["sub_total"] ?? "",
      shipping: json["shipping"] ?? "",
      total: json["total"] ?? "",
      customerId: json["customer_id"] ?? 0,
      customerPhone: json["customer_phone"],
      customerName: json["customer_name"],
      address: json["address"] == null
          ? null
          : AddressModel.fromJson(json["address"]),
      date: json["date"] ?? "",
      orderProducts: json["order_products"] == null
          ? []
          : List<OrderProduct>.from(
              json["order_products"]!.map((x) => OrderProduct.fromJson(x))),
      deliveryId: json["delivery_id"] ?? 0,
      delivery: json["delivery"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "cashier": cashier,
        "order_type": orderType,
        "order_status": orderStatus,
        "table_id": tableId,
        "sub_total": subTotal,
        "shipping": shipping,
        "total": total,
        "customer_id": customerId,
        "customer_phone": customerPhone,
        "customer_name": customerName,
        "address": address?.toJson(),
        "date": date,
        "order_products": orderProducts.map((x) => x?.toJson()).toList(),
        "delivery_id": deliveryId,
        "delivery": delivery,
      };

  @override
  String toString() {
    return "$id, $cashier, $orderType, $orderStatus, $tableId, $subTotal, $shipping, $total, $customerId, $customerPhone, $customerName, $address, $date, $orderProducts, $deliveryId, $delivery, ";
  }
}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.productId,
    required this.qty,
    required this.productPrice,
    required this.notes,
    required this.variationProductId,
    required this.productName,
    required this.variationName,
    required this.variationPrice,
  });

  final int id;
  final String productId;
  final String qty;
  final String productPrice;
  final dynamic notes;
  final dynamic variationProductId;
  final String productName;
  final dynamic variationName;
  final dynamic variationPrice;

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json["id"] ?? 0,
      productId: json["product_id"] ?? "",
      qty: json["qty"] ?? "",
      productPrice: json["product_price"] ?? "",
      notes: json["notes"],
      variationProductId: json["variation_product_id"],
      productName: json["product_name"] ?? "",
      variationName: json["variation_name"],
      variationPrice: json["variation_price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "qty": qty,
        "product_price": productPrice,
        "notes": notes,
        "variation_product_id": variationProductId,
        "product_name": productName,
        "variation_name": variationName,
        "variation_price": variationPrice,
      };

  @override
  String toString() {
    return "$id, $productId, $qty, $productPrice, $notes, $variationProductId, $productName, $variationName, $variationPrice, ";
  }
}
