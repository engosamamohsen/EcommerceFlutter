import 'package:Emend/models/category/category_model.dart';
import 'package:Emend/models/product/product_model.dart';

class HomeResponse {
  HomeResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final HomeModel data;

  HomeResponse.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      message = json['message'];
      data = HomeModel.fromJson(json['data']);
    } catch (e) {
      print("error $e");
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class HomeModel {
  HomeModel({
    required this.banners,
    required this.categories,
    required this.newestProduct,
    this.address,
    required this.flashSale,
    required this.mostSale,
  });
  late final List<Banners> banners;
  late final List<CategoryModel> categories;
  late final List<ProductModel> newestProduct;
  late final Null address;
  late final FlashSale flashSale;
  late final List<ProductModel> mostSale;

  HomeModel.fromJson(Map<String, dynamic> json) {
    try {} catch (e) {
      print("error $e");
    }
    banners =
        List.from(json['banners']).map((e) => Banners.fromJson(e)).toList();
    categories = List.from(json['categories'])
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    newestProduct = List.from(json['newest_product'])
        .map((e) => ProductModel.fromJson(e))
        .toList();
    address = null;
    flashSale = FlashSale.fromJson(json['flash_sale']);
    mostSale = List.from(json['most_sale'])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banners'] = banners.map((e) => e.toJson()).toList();
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['newest_product'] = newestProduct.map((e) => e.toJson()).toList();
    _data['address'] = address;
    _data['flash_sale'] = flashSale.toJson();
    _data['most_sale'] = mostSale.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Banners {
  Banners({
    required this.id,
    required this.image,
  });
  late final int id;
  late final String image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    return _data;
  }
}

class NewestProduct {
  NewestProduct({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.image,
    required this.likes,
    required this.isLike,
    required this.rate,
  });
  late final int id;
  late final String name;
  late final String? description;
  late final String price;
  late final String image;
  late final int likes;
  late final bool isLike;
  late final double rate;

  NewestProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = null;
    price = json['price'];
    image = json['image'];
    likes = json['likes'];
    isLike = json['isLike'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['image'] = image;
    _data['likes'] = likes;
    _data['isLike'] = isLike;
    _data['rate'] = rate;
    return _data;
  }
}

class FlashSale {
  FlashSale({
    required this.expiredAt,
    required this.products,
  });
  late final String expiredAt;
  late final List<ProductModel> products;

  FlashSale.fromJson(Map<String, dynamic> json) {
    expiredAt = json['expired_at'];
    products = List.from(json['products'])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['expired_at'] = expiredAt;
    // _data['products'] = ProductModel.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MostSale {
  MostSale({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.image,
    required this.likes,
    required this.isLike,
    required this.rate,
  });
  late final int id;
  late final String name;
  late final String? description;
  late final String price;
  late final String image;
  late final int likes;
  late final bool isLike;
  late final double rate;

  MostSale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = null;
    price = json['price'];
    image = json['image'];
    likes = json['likes'];
    isLike = json['isLike'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['image'] = image;
    _data['likes'] = likes;
    _data['isLike'] = isLike;
    _data['rate'] = rate;
    return _data;
  }
}
