class AddToCartRequest {
  AddToCartRequest({required this.productId, required this.count});

  final int productId;

  final String count;

  Map<String, dynamic> toMap() {
    return {'product_id': productId, 'count': count};
  }
}
