class OrderModel {
  OrderModel({
    required this.id,
    required this.orderType,
    required this.orderStatus,
    required this.subTotal,
    required this.shipping,
    required this.total,
    required this.customer,
    required this.phone,
    required this.deliveryId,
    required this.delivery,
    required this.tableId,
    required this.date,
  });

  final int id;
  final int orderType;
  final int orderStatus;
  final String subTotal;
  final String shipping;
  final String total;
  final String customer;
  final String phone;
  final int deliveryId;
  final int delivery;
  final int tableId;
  final String date;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"] ?? 0,
      orderType: json["order_type"] ?? 0,
      orderStatus: json["order_status"] ?? 0,
      subTotal: json["sub_total"] ?? "",
      shipping: json["shipping"] ?? "",
      total: json["total"] ?? "",
      customer: json["customer"] ?? "",
      phone: json["phone"] ?? "",
      deliveryId: json["delivery_id"] ?? 0,
      delivery: json["delivery"] ?? 0,
      tableId: json["table_id"] ?? 0,
      date: json["date"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_type": orderType,
        "order_status": orderStatus,
        "sub_total": subTotal,
        "shipping": shipping,
        "total": total,
        "customer": customer,
        "phone": phone,
        "delivery_id": deliveryId,
        "delivery": delivery,
        "table_id": tableId,
        "date": date,
      };

  @override
  String toString() {
    return "$id, $orderType, $orderStatus, $subTotal, $shipping, $total, $customer, $phone, $deliveryId, $delivery, $tableId, $date, ";
  }
}
