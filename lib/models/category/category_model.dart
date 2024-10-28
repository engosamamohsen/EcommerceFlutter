import 'package:Emend/models/product/product_model.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.products
  });
  late final int id;
  late final String name;
  late final String icon;
  late final List<ProductModel>? products;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    products = List.from(json['products'])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['icon'] = icon;
    _data['products'] = products?.map((e) => e.toJson()).toList();
    return _data;
  }
}
