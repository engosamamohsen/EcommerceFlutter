import 'package:Emend/models/category/category_model.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
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
    required this.categories,
  });

  final List<CategoryModel> categories;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      categories: json["categories"] == null
          ? []
          : List<CategoryModel>.from(
              json["categories"]!.map((x) => CategoryModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "categories": categories.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$categories, ";
  }
}
