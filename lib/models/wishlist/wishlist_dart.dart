class WishlistRequest {
  WishlistRequest({required this.productId});

  final String productId;

  Map<String, dynamic> toMap() {
    return {'product_id': productId};
  }
}
