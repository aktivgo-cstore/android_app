class CartBody {
  final int _productId;

  CartBody({required productId}) : _productId = productId;

  Map<String, dynamic> toApi() {
    return {
      'product_id': _productId,
    };
  }
}
