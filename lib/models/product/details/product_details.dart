// import 'package:auth/models/home/home_response.dart';

// class ProductDetailsResponse {
//   ProductDetailsResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//   late final int status;
//   late final String message;
//   late final Data data;

//   ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
//     try {
//       status = json['status'];
//       message = json['message'];
//       data = Data.fromJson(json['data']);
//     } catch (e) {
//       print("start error $e");
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.description,
//     required this.price,
//     required this.productStoreType,
//     required this.qty,
//     required this.qtyAlarm,
//     required this.barcode,
//     required this.wholesalePrice,
//     required this.categoryId,
//     required this.parentId,
//     required this.isParent,
//     required this.active,
//     required this.cartCount,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.likes,
//     required this.isLike,
//     required this.rate,
//     required this.category,
//     required this.gallery,
//     required this.technicalInformation,
//   });
//   List<Banners> banners = []; //osama banner

//   late final int id;
//   late final String name;
//   late final String image;
//   late final String description;
//   late final String price;
//   late final String productStoreType;
//   late final String qty;
//   late final String qtyAlarm;
//   late final String barcode;
//   late final String wholesalePrice;
//   late final int categoryId;
//   late final int cartCount;
//   late final String parentId;
//   late final String isParent;
//   late final String active;
//   late final String createdAt;
//   late final String updatedAt;
//   late final int likes;
//   late final bool isLike;
//   double? rate;
//   Category? category;
//   List<Gallery>? gallery;
//   List<TechnicalInformation>? technicalInformation;

//   Data.fromJson(Map<String, dynamic> json) {
//     try {
//       id = json['id'];
//       name = json['name'];
//       image = json['image'];
//       description = json['description'];
//       price = json['price'];
//       productStoreType = json['product_store_type'];
//       qty = json['qty'];
//       qtyAlarm = json['qty_alarm'];
//       barcode = json['barcode'];
//       wholesalePrice = json['wholesale_price'];
//       categoryId = json['category_id'];
//       parentId = json['parent_id'];
//       isParent = json['is_parent'];
//       cartCount = json['cart_count'];
//       active = json['active'];
//       createdAt = json['created_at'];
//       updatedAt = json['updated_at'];
//       likes = json['likes'];
//       isLike = json['isLike'];
//       rate = json['rate'];
//       category = Category.fromJson(json['category']);
//       gallery =
//           List.from(json['gallery']).map((e) => Gallery.fromJson(e)).toList();
//       technicalInformation = List.from(json['technical_information'])
//           .map((e) => TechnicalInformation.fromJson(e))
//           .toList();
//     } catch (e) {
//       print("start error $e");
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['image'] = image;
//     _data['description'] = description;
//     _data['price'] = price;
//     _data['product_store_type'] = productStoreType;
//     _data['qty'] = qty;
//     _data['qty_alarm'] = qtyAlarm;
//     _data['barcode'] = barcode;
//     _data['wholesale_price'] = wholesalePrice;
//     _data['category_id'] = categoryId;
//     _data['parent_id'] = parentId;
//     _data['is_parent'] = isParent;
//     _data['active'] = active;
//     _data['cart_count'] = cartCount;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['likes'] = likes;
//     _data['isLike'] = isLike;
//     _data['rate'] = rate ?? 0;
//     _data['category'] = category?.toJson();
//     _data['gallery'] =
//         (gallery != null ? gallery!.map((e) => e.toJson()).toList() : []);
//     _data['technical_information'] = (technicalInformation != null
//         ? technicalInformation!.map((e) => e.toJson()).toList()
//         : []);
//     return _data;
//   }
// }

// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     this.parentId,
//     required this.icon,
//     required this.active,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final Null parentId;
//   late final String icon;
//   late final String active;
//   late final String createdAt;
//   late final String updatedAt;

//   Category.fromJson(Map<String, dynamic> json) {
//     try {
//       id = json['id'];
//       name = json['name'];
//       parentId = null;
//       icon = json['icon'];
//       active = json['active'];
//       createdAt = json['created_at'];
//       updatedAt = json['updated_at'];
//     } catch (e) {
//       print("start error $e");
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['parent_id'] = parentId;
//     _data['icon'] = icon;
//     _data['active'] = active;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Gallery {
//   Gallery({
//     required this.id,
//     required this.image,
//   });
//   late final int id;
//   late final String image;

//   Gallery.fromJson(Map<String, dynamic> json) {
//     try {
//       id = json['id'];
//       image = json['image'];
//     } catch (e) {
//       print("start error $e");
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['image'] = image;
//     return _data;
//   }
// }

// class TechnicalInformation {
//   TechnicalInformation({
//     required this.id,
//     required this.key,
//     required this.value,
//   });
//   late final int id;
//   late final String key;
//   late final String value;

//   TechnicalInformation.fromJson(Map<String, dynamic> json) {
//     try {
//       id = json['id'];
//       key = json['key'];
//       value = json['value'];
//     } catch (e) {
//       print("start error $e");
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['key'] = key;
//     _data['value'] = value;
//     return _data;
//   }
// }
