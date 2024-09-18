import 'package:auth/models/home/home_response.dart';

class ProductDetailsResponse {
  ProductDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
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
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.productStoreType,
    required this.qty,
    required this.qtyAlarm,
    required this.barcode,
    required this.wholesalePrice,
    required this.categoryId,
    required this.parentId,
    required this.isParent,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.isLike,
    required this.rate,
    required this.category,
    required this.cartCount,
    required this.gallery,
    required this.technicalInformation,
  });

  final int id;
  final String name;
  final String image;
  final String description;
  final String price;
  final String productStoreType;
  final String qty;
  final String qtyAlarm;
  final String barcode;
  final String wholesalePrice;
  final int categoryId;
  final String parentId;
  final String isParent;
  final String active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int likes;
  final bool isLike;
  final double rate;
  final Category? category;
  String cartCount;
  final List<Banners> gallery;
  final List<TechnicalInformation> technicalInformation;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? "",
      productStoreType: json["product_store_type"] ?? "",
      qty: json["qty"] ?? "",
      qtyAlarm: json["qty_alarm"] ?? "",
      barcode: json["barcode"] ?? "",
      wholesalePrice: json["wholesale_price"] ?? "",
      categoryId: json["category_id"] ?? 0,
      parentId: json["parent_id"] ?? "",
      isParent: json["is_parent"] ?? "",
      active: json["active"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      likes: json["likes"] ?? 0,
      isLike: json["isLike"] ?? false,
      rate: json["rate"] ?? 0.0,
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      cartCount: json["cart_count"] ?? "",
      gallery: json["gallery"] == null
          ? []
          : List<Banners>.from(
              json["gallery"]!.map((x) => Banners.fromJson(x))),
      technicalInformation: json["technical_information"] == null
          ? []
          : List<TechnicalInformation>.from(json["technical_information"]!
              .map((x) => TechnicalInformation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "product_store_type": productStoreType,
        "qty": qty,
        "qty_alarm": qtyAlarm,
        "barcode": barcode,
        "wholesale_price": wholesalePrice,
        "category_id": categoryId,
        "parent_id": parentId,
        "is_parent": isParent,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "likes": likes,
        "isLike": isLike,
        "rate": rate,
        "category": category?.toJson(),
        "cart_count": cartCount,
        "gallery": gallery.map((x) => x?.toJson()).toList(),
        "technical_information":
            technicalInformation.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $image, $description, $price, $productStoreType, $qty, $qtyAlarm, $barcode, $wholesalePrice, $categoryId, $parentId, $isParent, $active, $createdAt, $updatedAt, $likes, $isLike, $rate, $category, $cartCount, $gallery, $technicalInformation, ";
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.parentId,
    required this.icon,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final dynamic parentId;
  final String icon;
  final String active;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      parentId: json["parent_id"],
      icon: json["icon"] ?? "",
      active: json["active"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "icon": icon,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $name, $parentId, $icon, $active, $createdAt, $updatedAt, ";
  }
}

class Gallery {
  Gallery({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json["id"] ?? 0,
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };

  @override
  String toString() {
    return "$id, $image, ";
  }
}

class TechnicalInformation {
  TechnicalInformation({
    required this.id,
    required this.key,
    required this.value,
  });

  final int id;
  final String key;
  final String value;

  factory TechnicalInformation.fromJson(Map<String, dynamic> json) {
    return TechnicalInformation(
      id: json["id"] ?? 0,
      key: json["key"] ?? "",
      value: json["value"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };

  @override
  String toString() {
    return "$id, $key, $value, ";
  }
}
