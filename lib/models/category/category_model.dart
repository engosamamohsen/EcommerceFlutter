class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
  });
  late final int id;
  late final String name;
  late final String icon;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['icon'] = icon;
    return _data;
  }
}
