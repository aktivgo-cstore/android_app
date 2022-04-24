import '../data/repository/cart_repository_impl.dart';
import '../data/repository/product_repository_impl.dart';
import '../data/repository/user_repository_impl.dart';
import '../domain/repository/cart_repository.dart';
import '../domain/repository/product_repository.dart';
import '../domain/repository/user_repository.dart';
import 'api_module.dart';

class RepositoryModule {
  static CartRepository? _cartRepository;
  static ProductRepository? _productRepository;
  static UserRepository? _userRepository;

  static CartRepository cartRepository() {
    _cartRepository =
        _cartRepository ?? CartRepositoryImpl(ApiModule.apiUtil());
    return _cartRepository!;
  }

  static ProductRepository productRepository() {
    _productRepository =
        _productRepository ?? ProductRepositoryImpl(ApiModule.apiUtil());
    return _productRepository!;
  }

  static UserRepository userRepository() {
    _userRepository =
        _userRepository ?? UserRepositoryImpl(ApiModule.apiUtil());
    return _userRepository!;
  }
}
