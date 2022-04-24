import '../../domain/model/cart.dart';
import '../../domain/repository/cart_repository.dart';
import '../api/api_util.dart';

class CartRepositoryImpl implements CartRepository {
  final ApiUtil apiUtil;

  CartRepositoryImpl(this.apiUtil);

  @override
  Future<void> addProduct({
    required int userId,
    required int productId,
    required String token,
  }) {
    return apiUtil.addProduct(
      userId: userId,
      productId: productId,
      token: token,
    );
  }

  @override
  Future<void> deleteProduct({
    required int userId,
    required int productId,
    required String token,
  }) {
    return apiUtil.deleteProduct(
      userId: userId,
      productId: productId,
      token: token,
    );
  }

  @override
  Future<Cart> getCart({required int userId, required String token}) {
    return apiUtil.getCart(userId: userId, token: token);
  }
}
