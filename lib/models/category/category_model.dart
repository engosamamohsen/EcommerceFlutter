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
    try{
      id = json['id'];
      name = json['name'];
      icon = json['icon'];
      if(json.containsKey("products"))
        products = List.from(json['products'])
            .map((e) => ProductModel.fromJson(e))
            .toList();
    }catch(e){
      print(e.toString());
    }
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
