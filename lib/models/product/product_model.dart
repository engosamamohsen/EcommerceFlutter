class ProductModel {
  ProductModel({
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
  late final double price;
  late final String image;
  late final int likes;
  late bool isLike;
  late final double rate;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = null;
    price = (json['price'] as num).toDouble();
    image = json['image'];
    likes = json['likes'];
    isLike = json['isLike'];
    rate = (json['rate'] as num).toDouble();
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
