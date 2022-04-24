import '../model/cart.dart';

abstract class CartRepository {
  Future<Cart> getCart({
    required int userId,
    required String token,
  });

  Future<void> addProduct({
    required int userId,
    required int productId,
    required String token,
  });

  Future<void> deleteProduct({
    required int userId,
    required int productId,
    required String token,
  });
}
