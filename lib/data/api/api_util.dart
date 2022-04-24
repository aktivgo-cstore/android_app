import '../../domain/model/cart.dart';
import '../../domain/model/product.dart';
import '../../domain/model/user.dart';
import '../mapper/cart_mapper.dart';
import '../mapper/login_mapper.dart';
import '../mapper/products_mapper.dart';
import '../mapper/registration_mapper.dart';
import 'request/cart_body.dart';
import 'request/login_body.dart';
import 'request/logout_body.dart';
import 'request/registration_body.dart';
import 'service/cart_service.dart';
import 'service/product_service.dart';
import 'service/user_service.dart';

class ApiUtil {
  final UserService _userService;
  final ProductService _productService;
  final CartService _cartService;

  ApiUtil({
    required userService,
    required productService,
    required cartService,
  })  : _userService = userService,
        _productService = productService,
        _cartService = cartService;

  Future<User> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final body = RegistrationBody(
      fullName: fullName,
      email: email,
      password: password,
    );
    final response = await _userService.register(body);
    return RegistrationMapper.fromApi(response);
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final body = LoginBody(
      email: email,
      password: password,
    );
    final response = await _userService.login(body);
    return LoginMapper.fromApi(response);
  }

  Future<void> logout({required String token}) async {
    final body = LogoutBody(token: token);
    await _userService.logout(body);
  }

  Future<List<Product>> getProducts({required String token}) async {
    final response = await _productService.getProducts(token: token);
    return ProductsMapper.fromApi(response);
  }

  Future<Cart> getCart({
    required int userId,
    required String token,
  }) async {
    final response = await _cartService.getCart(
      userId: userId,
      token: token,
    );
    return CartMapper.fromApi(response);
  }

  Future<void> addProduct({
    required int userId,
    required int productId,
    required String token,
  }) async {
    final body = CartBody(productId: productId);
    await _cartService.addProduct(
      userId: userId,
      cartBody: body,
      token: token,
    );
  }

  Future<void> deleteProduct({
    required int userId,
    required int productId,
    required String token,
  }) async {
    final body = CartBody(productId: productId);
    await _cartService.deleteProduct(
      userId: userId,
      cartBody: body,
      token: token,
    );
  }
}
