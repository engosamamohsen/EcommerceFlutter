class AddWishlistResponse {
  AddWishlistResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data? data;

  factory AddWishlistResponse.fromJson(Map<String, dynamic> json) {
    return AddWishlistResponse(
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
    required this.isFavorite,
  });

  final int isFavorite;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      isFavorite: json["isFavorite"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "isFavorite": isFavorite,
      };

  @override
  String toString() {
    return "$isFavorite, ";
  }
}
