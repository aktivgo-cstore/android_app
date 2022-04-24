import '../data/api/api_util.dart';
import '../data/api/service/cart_service.dart';
import '../data/api/service/product_service.dart';
import '../data/api/service/user_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil = _apiUtil ??
        ApiUtil(
          userService: UserService(),
          productService: ProductService(),
          cartService: CartService(),
        );
    return _apiUtil!;
  }
}
