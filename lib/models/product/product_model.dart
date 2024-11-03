class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.priceAfter,
    required this.discount,
    required this.image,
    required this.likes,
    required this.isLike,
    required this.rate,
  });
  late final int id;
  late final String name;
  late final String? description;
  late final String discount;
  late final double price;
  late final double priceAfter;
  late final String image;
  late final int likes;
  late bool isLike;
  late final double rate;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = null;
    price = (json['price'] as num).toDouble();
    priceAfter = (json['price_after'] as num).toDouble();
    discount = json['discount'];
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
    _data['price_after'] = priceAfter;
    _data['discount'] = discount;
    _data['image'] = image;
    _data['likes'] = likes;
    _data['isLike'] = isLike;
    _data['rate'] = rate;
    return _data;
  }
}
