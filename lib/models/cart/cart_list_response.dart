class CartListResponse {
  CartListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory CartListResponse.fromJson(Map<String, dynamic> json) {
    return CartListResponse(
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

  final List<CartModel> data;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json["data"] == null
          ? []
          : List<CartModel>.from(
              json["data"]!.map((x) => CartModel.fromJson(x))),
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

class CartModel {
  CartModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfter,
    required this.image,
    required this.count,
  });

  final int id;
  final int productId;
  final String name;
  final Category? category;
  final String description;
  final String price;
  final String discount;
  final String priceAfter;
  final String image;
  String count;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"] ?? 0,
      productId: json["product_id"] ?? 0,
      name: json["name"] ?? "",
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      description: json["description"] ?? "",
      price: json["price"] ?? "",
      discount: json["discount"] ?? "",
      priceAfter: json["price_after"] ?? "",
      image: json["image"] ?? "",
      count: json["count"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "category": category?.toJson(),
        "description": description,
        "price": price,
        "discount": discount,
        "price_after": priceAfter,
        "image": image,
        "count": count,
      };

  @override
  String toString() {
    return "$id, $productId, $name, $category, $description, $price, $discount, $priceAfter, $image, $count, ";
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.parent,
  });

  final int id;
  final String name;
  final String icon;
  final dynamic parent;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      icon: json["icon"] ?? "",
      parent: json["parent"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "parent": parent,
      };

  @override
  String toString() {
    return "$id, $name, $icon, $parent, ";
  }
}
